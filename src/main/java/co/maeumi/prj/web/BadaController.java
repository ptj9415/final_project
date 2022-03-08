package co.maeumi.prj.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.http.protocol.HTTP;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.google.gson.JsonObject;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.member.service.MemberService;
import co.maeumi.prj.member.service.MemberVO;
import co.maeumi.prj.notice.service.NoticeService;
import co.maeumi.prj.notice.service.NoticeVO;
import co.maeumi.prj.service.CoolsmsService;
import co.maeumi.prj.service.KakaoService;
import co.maeumi.prj.service.NaverLoginBO;
import co.maeumi.prj.service.Search;

@Controller
public class BadaController {

	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	MemberVO mvo = new MemberVO();

	// root-context.xml에서 등록했던 mailSender bean을 의존성 주입ㄱㄱ
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private MemberService memberDao;
	@Autowired
	private CounselorService counselorDao;
	@Autowired
	private KakaoService ks;
	@Autowired
	private NoticeService noticeDao;
	@Resource(name = "uploadPath") // servlet-context.xml에서 정의함. 상대경로로 변경해주어야 함(현재 하드코딩 상태)
	String uploadPath;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	/* ===== 사용자 화면 ===== */

	// 로그인하는 페이지로 이동
	@RequestMapping("/loginForm.do")
	public String loginForm(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("네이버 :" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		/* 생성한 인증 URL을 View로 전달 */

		return "user/login/loginForm";
	}

	
	// 일반 로그인 처리
	@ResponseBody
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, MemberVO mvo, HttpSession session, CounselorVO cvo) {

		mvo.setM_email(request.getParameter("email"));
		mvo.setM_password(request.getParameter("password"));
		mvo = memberDao.memberLogin(mvo);

		String message = "";
		if (mvo != null) { // 멤버로 로그인 성공한 경우~
			session.setAttribute("email", request.getParameter("email"));
			session.setAttribute("nickname", mvo.getM_nickname());
			session.setAttribute("type", mvo.getM_type());
			System.out.println("로그인 성공");
			System.out.println("로그인으로 담은 세션값 이메일 : " + (String)session.getAttribute("email"));
			System.out.println("로그인으로 담은 세션값 닉네임 : " + (String)session.getAttribute("nickname"));
			System.out.println("로그인으로 담은 세션값 가입유형 : " + (String)session.getAttribute("type"));
			message = "YES";
		} else {
			cvo.setC_email(request.getParameter("email"));
			cvo.setC_password(request.getParameter("password"));
			cvo = counselorDao.counselorLogin(cvo);

			if (cvo != null) { // 상담사로 로그인 성공한 경우.
				session.setAttribute("email", request.getParameter("email"));
				System.out.println("세션에 이메일이 담겼나? " + session.getAttribute("email"));
				message = "YES";
			} else { // 일반회원, 상담사 둘 다 로그인 실패한 경우.
				message = "NO";
			}
		}

		return message;
	}

	@RequestMapping("/loginSuccess.do")
	public String loginSuccess(Model model, HttpServletRequest request) {
		return "user/home/home";
	}

	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {

		System.out.println("로그아웃 하면서 내가 지울 세션값 이름: " + session);
		session.invalidate();
		return "user/home/home";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session,
			MemberVO mvo) throws IOException, ParseException {

		System.out.println("여기는 callback");
		OAuth2AccessToken oauthToken;
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());

		model.addAttribute("result", apiResult);
		System.out.println("result:  " + apiResult);

		// DB에 넣기
		String message = null;
										
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObject = (JSONObject) jsonParser.parse(naverLoginBO.getUserProfile(oauthToken).toString());

		JSONObject response = (JSONObject) jsonObject.get("response");

		System.out.println("이것은: " + jsonObject.get("response"));
		System.out.println("이메일은: " + (String) response.get("email"));
		System.out.println("닉네임은: " + (String) response.get("nickname"));
		System.out.println("연락처는 선택이지만 : " + (String) response.get("mobile"));

		MemberVO mvo2 = new MemberVO(); // 기존에 존재유무 판단하기 위한 용도의 인스턴스 생성.
		mvo2.setM_email((String) response.get("email"));
		mvo2.setM_type("네이버");
		mvo2 = memberDao.naverSelect(mvo2);

		if (mvo2 == null) { // db에 해당 유저의 정보가 없다면.
			mvo.setM_email((String) response.get("email"));
			mvo.setM_nickname((String) response.get("nickname"));
			String beforePhone = (String) response.get("mobile");
			String realPhone = beforePhone.replaceAll("-", "");
			mvo.setM_phone(realPhone);
			mvo.setM_password("");
			mvo.setM_type("네이버");
			int n = memberDao.memberInsert(mvo);
			if (n != 0) {  // 네이버로 로그인 성공했다면~ 
				message = (String) response.get("email");
				System.out.println(message + " 님 네이버 로그인 성공");
				session.setAttribute("email", message); // 세션값 설정
				session.setAttribute("nickname", (String) response.get("nickname"));
				session.setAttribute("type", "네이버");
				return "user/home/home";
			} else {
				message = "실패햇다.....";
				System.out.println(message);
				return "user/login/loginForm";
			}
		}
		// null이 아니었다면 바로 db에 데이터를 넣을 필요없이 바로 로그인
		session.setAttribute("email", (String) response.get("email")); // 세션값 설정
		session.setAttribute("nickname", (String) response.get("nickname"));
		session.setAttribute("type", "네이버");
		System.out.println("네이버 로그인으로 담은 세션값1 이메일: " + (String) response.get("email"));
		System.out.println("네이버 로그인으로 담은 세션값2 닉네임: " + (String) response.get("nickname"));
		System.out.println("네이버 로그인으로 담은 세션값3 가입유형: " + (String)session.getAttribute("type"));
		
		return "user/home/home";
	}

	// 카카오 로그인 컨트롤러. code를 받을 메서드.
	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, MemberVO mvo,
			HttpSession session) throws Exception {

		System.out.println("##############" + code); // 카카오로 동의하고 로그인 했을 때 이클립스 콘솔창에 code뜨는지 확인. 뜨면 ok.

		String access_Token = ks.getAccessToken(code); // MemberService에 access_Token을 요청하는 메서드 생성해야 함.
		System.out.println("######## access_Token : " + access_Token);

		// access_Token을 통해 사용자 정보 얻어오는 부분.
		HashMap<String, Object> userInfo = ks.getUserInfo(access_Token);
		System.out.println("###access_Token#### : " + access_Token);
		System.out.println("###nickname#### : " + userInfo.get("nickname"));
		System.out.println("###email#### : " + userInfo.get("email"));

		// 밑에서부터 실행이 안 됨. 따로 kakao dtd객체와 member-map.xml을 추가해야하는지 고민해보기.
		String k_email = (String) userInfo.get("email");
		String k_nickname = (String) userInfo.get("nickname");
		System.out.println("mvo값에 담을 이메일 값: " + k_email);
		System.out.println("mvo값에 담을 닉네임 값." + k_nickname);
		
		
		// MemberVO mvo2 = new MemberVO(); // 존재유무 체크용으로 임의의 dto인스턴스 생성.
		mvo.setM_email(k_email);
		mvo.setM_type("카카오");
		System.out.println("mvo객체에 담긴 email의 값:  " + mvo.getM_email());
		System.out.println("mvo객체에 담긴 type의 값. " + mvo.getM_type());
		mvo = memberDao.kakaoSelect(mvo); // 이메일과 가입유형 둘 다 판단 => 이메일 중복 피하기 위함.

		MemberVO mvo2 = new MemberVO();
		if (mvo == null) { // 기존에 db에 카카오 로그인 정보가 없었다면 db에 추가한다.
			mvo2.setM_email(k_email);
			mvo2.setM_nickname(k_nickname);
			mvo2.setM_type("카카오");
			mvo2.setM_password("");
			mvo2.setM_phone("");
			int n = memberDao.memberInsert(mvo2);
			if (n != 0) { // insert 결과 성공이면,
				session.setAttribute("email", mvo2.getM_nickname()); // 세션값 담아주고 홈으로.
				return "user/home/home";
			} else { // insert가 실패한 경우.
				System.out.println("에러발생"); // 에러발생하면 로그인화면으로 다시.
				return "user/login/loginForm";
			}
		}
		// mvo가 null이 아닌 경우, 즉 이미 해당 아이디와 유형이 존재히면~
		mvo2.setM_email(k_email); // 세션값을 이용하기 위함.
		mvo2.setM_nickname(k_nickname); // 세션값을 통해 header메뉴 동적으로 보여주기 위하여
		mvo2.setM_type("카카오");
		session.setAttribute("email", mvo2.getM_nickname());
		session.setAttribute("nickname", mvo2.getM_nickname());
		session.setAttribute("type", mvo2.getM_type());
		System.out.println("카카오 로그인 성공으로 담은 세션값1 이메일 : " + mvo2.getM_email());
		System.out.println("카카오 로그인 성공으로 담은 세션값2 닉네임 : " + mvo2.getM_nickname());
		System.out.println("카카오 로그인 성공으로 담은 세션값3 가입유형 : " + mvo2.getM_type());
		
		return "user/home/home";
	} // 카카오로그인

	@RequestMapping("/findEmailPopup.do")
	public String findEmailPopup(Model model, HttpServletRequest request) {

		return "layouts/findEmail";
	};

	// 이메일 인증화면으로 이동
	@RequestMapping("/userEmailCheck.do")
	public String emailCheck(Model model) {
		return "user/login/userEmailCheck";
	}

	// 일반회원 약관동의 화면
	@RequestMapping("/userTermsOfService.do")
	public String termsCheck(Model model, HttpServletRequest request) {
		return "user/login/userTermsOfService";
	}

	// 일반회원 이메일 중복체크
	@PostMapping("/ajaxEmailCheck.do")
	@ResponseBody
	public String ajaxEmailCheck(HttpServletRequest request, Model model) {
		mvo.setM_email(request.getParameter("chkEmail"));
		boolean b = memberDao.memberEmailCheck(mvo);
		String check = "0";
		if (b) { // 중복 이메일이 존재하는 경우.
			check = "1";
		}
		return check;
	}
	
	

	// 이메일 인증
	@RequestMapping(value = "/ajaxChkNum.do", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxChkNum(String inputEmail) throws Exception {

		System.out.println("이메일 데이터 전송 확인");
		System.out.println("인증번호: " + inputEmail);

		// 인증번호(난수) 생성
		Random random = new Random();
		int checkNum = random.nextInt(8888) + 1111; // 1111~9999 범위의 숫자를 얻기 위함.
		System.out.println("인증번호" + checkNum); // 콘솔창에 인증번호 나오는지 확인.

					// 이메일 보내기. 주석 삭제하면 실제 이메일 날라감. ( 변수를 선언해서 이메일 전송에 필요로 한 데이터를 할당한다.) 
					String setFrom = "yd23fp@gmail.com";  // root-context.xml에 작성한 자신의 이메일 계정. 아이디랑 메일주소 모두 입력!
					String toMail = inputEmail;					// 수신받을 이메일. view로부터 받은 이메일 주소인 변수 email을 사용
					String title = "회원가입 인증 이메일 입니다.";  // 자신이 보낼 이메일 제목
					String content = 						// 자신이 보낼 이메일 내용
							"Maeumi 에 방문해주셔서 감사ㅎㅎ" +
							"<br><br>" +
							"인증번호는 " + checkNum + " << 이거. " +
							"<br>" +
							"해당 인증번호를 인증번호 확인란에 입력하슈~ ";
					
					try  {
						MimeMessage message = mailSender.createMimeMessage();
						MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
						helper.setFrom(setFrom);
						helper.setTo(toMail);
						helper.setSubject(title);
						helper.setText(content, true);
						mailSender.send(message);
						
					} catch (Exception e ) {
						e.printStackTrace();
					}

		// 생성한 인증번호 변수를 view로 반환. 생성한 인증번호의 경우 int 타입. ajax를 통한 요청으로 인해 view로 다시 반환할 때
		// 데이터 타입은 String만 가능.
		String num = Integer.toString(checkNum); // return타입도 void에서 String으로 수정. 테스트는 끝났으니깐.
		return num; // ajax를 요청한 view페이지로 num데이터(인증번호)를 전달한다. => 해당 view의 ajax구문으로 ㄱㄱ
	}

	// 멤버 회원가입 페이지로 이동
	@RequestMapping("/userJoinForm.do")
	public String memberJoinForm(Model model, HttpServletRequest request) {

		System.out.println(request.getParameter("inputEmail"));
		model.addAttribute("m_email", request.getParameter("inputEmail"));
		return "user/login/userJoinForm";
	}

	// 닉네임 중복체크
	@PostMapping("/ajaxNicknameCheck.do")
	@ResponseBody
	public String ajaxNicknameCheck(HttpServletRequest request, Model model) {
		// MemberVO mvo = new MemberVO();
		mvo.setM_nickname(request.getParameter("chkNickname"));
		boolean b = memberDao.memberNicknameCheck(mvo);
		String check = "0"; // ajax 호출한 곳으로 결과를 보내기 위한 용도.
		if (b) { // 존재하는 경우.
			check = "1";
		}
		return check;
	}
	
	// db에 회원가입 정보 넣기
	@PostMapping("/memberJoin.do")
	public String memberJoin(HttpServletRequest request, Model model, MemberVO mvo) {
		mvo.setM_email(request.getParameter("email"));
		mvo.setM_nickname(request.getParameter("nickname"));
		mvo.setM_password(request.getParameter("password"));
		mvo.setM_phone(request.getParameter("phone"));
		mvo.setM_type(request.getParameter("type"));
		mvo.setM_status("T");

		String joinMessage = null;
		int n = memberDao.memberInsert(mvo);
		if (n != 0) {
			joinMessage = mvo.getM_nickname();
		}

		model.addAttribute("message", joinMessage);
		return "user/login/userJoinFinish";
	}

	@RequestMapping(value = "/ajaxPhoneChk.do", method = RequestMethod.GET)
	@ResponseBody
	public String ajaxPhoneChk(@RequestParam("inputPhoneChk") String userPhoneNumber) {

		// 인증번호로 사용할 난수 생성. email인증과 똑같.
		Random random = new Random();
		int randomNumber = random.nextInt(8888) + 1111; // 1111~9999 범위의 숫자가 생성.
		System.out.println("인증번호" + randomNumber); // 콘솔창에 인증번호 나오는지 test용.

		CoolsmsService.sendPhoneChk(userPhoneNumber, randomNumber);

		return Integer.toString(randomNumber);

	}
	
	// 이메일 찾기
	@ResponseBody
	@RequestMapping(value = "/ajaxFindEmail.do", produces = "application/text; charset=utf8")
	public String ajaxFindEmail(Model model, HttpServletRequest request, MemberVO mvo, CounselorVO cvo) {

		String checkPhone = request.getParameter("sendPhoneNum");
		System.out.println("폼에서 넘어온 휴대폰 번호" + checkPhone);
		mvo.setM_phone(checkPhone);
		mvo.setM_type("MAEUMI");
		mvo = memberDao.memberFindEmail(mvo);

		String responseText = null;
		
		if (mvo != null) {
			String email = mvo.getM_email();
			String type = mvo.getM_type();
			responseText = "조회된 Email은 " + email + ", 가입경로는 " + type;
			System.out.println("멤버에 존재: " + responseText);
		} else {
			cvo.setC_phone(checkPhone);
			cvo = counselorDao.counselorFindEmail(cvo);
			if (cvo != null) {
				String email = cvo.getC_email();
				responseText = "상담사님의 email은  " + email + " 입니다. ";
				System.out.println("상담사에 존재: " + responseText);
			} else {
				responseText = "NO";
			}
		}
		return responseText;

	}

	// 상담사 약관동의 화면
	@RequestMapping("/counselorTermsOfService.do")
	public String counselorTermsOfService() {
		return "user/login/counselorTermsOfService";
	}
	
	// 상담사 이메일 체크
	@RequestMapping("/counselorEmailCheck.do")
	public String cEmailCheck(Model model) {
		return "user/login/counselorEmailCheck";
	}
	
	// 상담사 이메일 중복체크
		@PostMapping("/cAjaxEmailCheck.do")
		@ResponseBody
		public String cAjaxEmailCheck(HttpServletRequest request, Model model, CounselorVO cvo) {
			cvo.setC_email(request.getParameter("chkEmail"));
			boolean b = counselorDao.counselorEmailCheck(cvo);
			String check = "0";
			if (b) { // 중복 이메일이 존재하는 경우.
				check = "1";
			}
			return check;
		}
	
	// 상담사 회원가입 양식 화면
	@RequestMapping("/counselorJoinForm.do")
	public String counselorJoinForm(Model model, HttpServletRequest request) {
		model.addAttribute("c_email", request.getParameter("inputEmail"));
		return "user/login/counselorJoinForm";
	}

	
	// 상담사 회원가입 처리. 
	@RequestMapping("/counselorJoin.do")
	public String counselorJoin(HttpServletRequest request, Model model, CounselorVO cvo) {
		
		// JoinForm에서 넘긴 8개 값. 
		cvo.setC_email(request.getParameter("email"));
		cvo.setC_name(request.getParameter("name"));
		cvo.setC_birthdate(request.getParameter("birthdate"));
		cvo.setC_gender(request.getParameter("gender"));
		cvo.setC_password(request.getParameter("password"));
		cvo.setC_address(request.getParameter("address"));
		cvo.setC_phone(request.getParameter("phone"));
		cvo.setC_grade("심리상담사");   // 기본값으로 심리상담사 줌.
		cvo.setC_admin("C");
		
		counselorDao.counselorInsert(cvo);
		
		return "user/login/counselorJoinFinish";
		
		
	}
	

	/* ========== 관리자 화면 (공지사항 관리 ) ========= */

	// 공지사항 메인폼으로 이동
	@RequestMapping("/adminNoticeList.do")
	public String adminNoticeList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "all") String n_category,
			@RequestParam(required = false) String n_title, Search svo) throws Exception {

		model.addAttribute("search", svo);
		svo.setN_category(n_category);
		svo.setN_title(n_title);

		int listCnt = noticeDao.getNoticeListCnt(svo); // 페이징 처리를 위해 필요한, 총 게시글 수 계산.

		svo.pageinfo(page, range, listCnt);  // 현재페이지, 현재 속한 페이지범위, 총 게시글 수를 인자로 가진다.

		List<NoticeVO> list = noticeDao.noticeSearchselect(svo);
		for(int i = 0; i < list.size(); i++) {
			String date = list.get(i).getN_writedate();
			date = date.substring(0, 10);
			list.get(i).setN_writedate(date);
		}
		model.addAttribute("pagination", svo);  // 페이징처리 
		model.addAttribute("notice", list);  // 기존의 공지사항 리스트 대신

		return "admin/noticemanage/adminNoticeList";
	}
	

	// 공지사항 작성하는 폼으로 이동
	@RequestMapping("/adminNoticeForm.do")
	public String adminNoticeForm(Model model, HttpServletRequest request, HttpSession session) {

		return "admin/noticemanage/adminNoticeForm";
	}

	// 공지사항 조회하는 폼
	@RequestMapping("/noticeRead.do")
	public String noticeRead(Model model, HttpServletRequest request, NoticeVO vo) {

		model.addAttribute("notices", noticeDao.noticeSelect(vo));

		return "admin/noticemanage/adminNoticeRead";
	}

	// 공지사항 삭제
	@ResponseBody
	@PostMapping("/noticeDelete.do")
	public String noticeDelete(HttpServletRequest request, Model model, NoticeVO vo) {

		System.out.println("ajax로 제대로 no번호가 넘어왔는지? : " + request.getParameter("deleteNum"));

		int number = Integer.valueOf(request.getParameter("deleteNum"));
		vo.setN_no(number);

		int n = noticeDao.noticeDelete(vo);
		String message = null;

		if (n != 0) {
			message = "YES";
		} else {
			message = "NO";
		}
		return message;
	}

	// 공지사항 수정하러 이동.
	@RequestMapping("/noticeUpdate.do")
	public String noticeUpdate(Model model, NoticeVO vo) {
		// 파라미터 가져와서 해당 no에 해당하는 정보들을 폼에 넘겨줘야 함.
		
		model.addAttribute("notices", noticeDao.noticeSelect(vo));

		return "admin/noticemanage/adminNoticeUpdate";
	}

	// 공지사항 수정 후 저장
	@RequestMapping("/noticeUpdateEnd.do")
	public ModelAndView noticeUpdateEnd(ModelAndView mav, NoticeVO vo, HttpServletRequest request,
			HttpServletResponse response, @RequestParam("fileName") MultipartFile file) throws Exception {

		// 파일 업로드 처리
		String savedName = file.getOriginalFilename();
		String mSavedName = null; // 중복 가공된 파일. 실제 물리파일.
		if( savedName != "") {    // 첨부한 게 없다면 pfilename컬럼에 값이 안 들어가도록.
		mSavedName = uploadFile(savedName, file.getBytes());  // 첨부파일명 랜덤생성하는 메소드. 밑에 정의되어 있음.
		} 		
		// 모델앤뷰의 뷰 경로지정noticeMain.do
		mav.setViewName("redirect:adminNoticeList.do");
		// 속성추가
		mav.addObject("savedName", mSavedName);
		String origincode = request.getParameter("summernote");
		System.out.println(origincode);

		// 이미지 파일일 경우 코드 잘라서 쓰기.
		// 홈페이지 구조상 이미지파일이 먼저 들어가야 되기 때문에 이렇게 만듬.

		String result = origincode.replaceAll(request.getContextPath() + "/resources/fileupload/", "therapyEditor/");
		System.out.println(result);
		vo.setN_content(result);
		noticeDao.noticeUpdate(vo);
		
		return mav;
	}

	// 공지사항 선택삭제
	@ResponseBody
	@RequestMapping(value = "/ajaxCheckDelete.do", method = RequestMethod.POST)
	public int ajaxCheckDelete(HttpServletRequest request, NoticeVO vo,
			@RequestParam(value = "sendCheck[]") List<String> chAry) {

		int result = 0;
		int partNum = 0;

		for (String i : chAry) {
			partNum = Integer.parseInt(i);
			vo.setN_no(partNum);
			noticeDao.noticeDelete(vo);
			result = 1;
		}
		return result; // 이 값이 ajax의 responseText.
	};

	// 공지사항 등록
	@RequestMapping("/noticeRegister.do")
	public ModelAndView noticeRegister(ModelAndView mav, NoticeVO vo, HttpServletRequest request,
			HttpServletResponse response, @RequestParam("fileName") MultipartFile file) throws Exception {

		// 파일 업로드 처리
		String savedName = file.getOriginalFilename();
		System.out.println("첨부파일 한 게 없는데, 뭐지? " + savedName);
		String mSavedName = null; // 중복 가공된 파일. 실제 물리파일.
		if( savedName != "") {    // 첨부한 게 없다면 pfilename컬럼에 값이 안 들어가도록.
		mSavedName = uploadFile(savedName, file.getBytes());  // 첨부파일명 랜덤생성하는 메소드. 밑에 정의되어 있음.
		} 
		
		// 모델앤뷰의 뷰 경로지정noticeMain.do
		mav.setViewName("redirect:adminNoticeList.do");
		// 속성추가
		mav.addObject("savedName", mSavedName);

		// insert구문. 첨부파일 있으면 첨부파일도.
		String origincode = request.getParameter("summernote");
		System.out.println(origincode);
		String result = origincode.replaceAll(request.getContextPath() + "/resources/fileupload/", "therapyEditor/");
		System.out.println(result);
		
		
		vo.setN_filename(savedName); // db에 저장될 원본파일명
		vo.setN_pfilename(mSavedName); // db에 저장될 실제 물리파일명.
		vo.setN_writer("관리자"); // 작성자(나중에 세션값 집어넣음)
		vo.setN_content(result); // 내용		

		// 값 넣기.
		noticeDao.noticeInsert(vo);
		return mav;
	}

	// 위 공지사항 등록 커멘드 내부 첨부파일명 랜덤생성
	private String uploadFile(String originalName, byte[] fileData) throws Exception {
		// uuid 생성
		UUID uuid = UUID.randomUUID();
		// 랜덤생성 + 파일이름 저장
		String savedName = uuid.toString() + "_" + originalName; // 가공된 파일이름.
		File target = new File(uploadPath, savedName);   // 가공된 파일이름을 servlet-context.xml에 등록한 bean의 경로에 저장.
		// 임시디렉토리에 저장된 업로드된 파일을 지정된 디렉토리로 복사. 실제 프로젝트 시연할 때는 uploadPath 의 경로를 변경해야 함(
		// servlet-context.xml)
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}

	// summernote를 통한 이미지 업로드. => 경로를 작성하는 부분 모두 상대경로로 수정해야 함
	@RequestMapping(value = "/summernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();

		// 경로 할 때 마다 계속 바꿔줘야함 아니면 절대 에디터 이미지 업로드 안됨.
		// Eclipse 파일 물리 경로 방식 (이클립스 내부에 저장)
		// String SAVE_PATH =
		// "C:\\final_project\\final_project\\src\\main\\webapp\\editor\\";
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\resources\\noticeimage\\"; // 업로드하면 파일이 저장되는 이클립스 내부경로. 하드코딩 상태. 수정해야 함.
		
		
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot + "resources/image/";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		File mtargetFile = new File(SAVE_PATH + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			multipartFile.transferTo(mtargetFile); // 다운로드 컨트롤러 만들고 뒤에 파일명 넣어주면 해당경로 파일을 다운로드해준다.
			jsonObject.addProperty("url", "/prj/resources/image/" + savedFileName);
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println(a);
		return a;
	}

	// 첨부파일 다운로드 * 밑에 경로를 작성하는 부분은 모두 상대경로로 수정해야 함
	@RequestMapping("/fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String filename = request.getParameter("fileName"); // noticeRead.jsp에서 get방식으로 보낸 name속성값이 filename임.
		String encodingFilename = "";
		System.out.println("1. filename: " + filename);
		String realFilename = "";
		
		String downName = request.getParameter("downName");
		System.out.println("downName 확인 : " + downName);
		
		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				encodingFilename = URLEncoder.encode(downName, "UTF-8").replaceAll("\\+", "%20");
				System.out.println("2. filename: " + downName);
			} else {
				encodingFilename = new String(downName.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		realFilename = uploadPath + filename;  
		System.out.println("3. realfilename: " + realFilename);
		File file1 = new File(realFilename);
		if (!file1.exists()) {
			System.out.println("존재유무 확인 ~=================");
			return;
		}
		// 파일명 지정
		System.out.println("encodingFilename의 이름: " + encodingFilename);
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + encodingFilename + "\"");
		
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (Exception e) {
			System.out.println("FileNotFoundException : " + e);
		}
		
		
	}
	
	
	// 공지사항 상단 고정 처리하기. 
	@ResponseBody
	@RequestMapping("/statusUpdate.do")
	public String statusUpdate(HttpServletRequest request, HttpServletResponse response, NoticeVO vo) {
		
		int statusNum = Integer.valueOf(request.getParameter("statusNum"));
		String statusVal = request.getParameter("statusVal");
		
		System.out.println("넘어온 게시글의 번호: " + statusNum);
		System.out.println("넘어온 고정상태 : " + statusVal ); // null이거나 '고정' 이거나 
		
		String message = null;
		
		vo.setN_no(statusNum);
		
		if(!statusVal.equals("")) {   // null상태가 아닌, 즉 '고정'인 상태. => null로 바꿔줘야 함.
			vo.setN_status("");   
		} else {  // null이었던 경우, '고정'으로 값 변경
			vo.setN_status("고정");
		}	
		
		System.out.println("넘버는 정상적으로 당맜는지 체크 =======  " + vo.getN_no());
		System.out.println("고정상태값은 제대로 담았는지 체크 ========== " +  vo.getN_status());
		
		
		int n = noticeDao.statusUpdate(vo);
		if(n !=0) { // 성공한 경우
			message = "YES";
		}
		return message;  
	}
	
	// 사용자뷰 공지사항으로 이동. (여기도 페이징 처리해야 함..) 
	@RequestMapping("/userNoticeList.do")
	public String userNoticeList(HttpServletRequest request, HttpServletResponse response, Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "all") String n_category
			, @RequestParam(required = false) String n_title, Search svo) throws Exception {
		
		model.addAttribute("search", svo);  // '제목'과 '말머리' 요소로 서칭하기 위함.
		svo.setN_category(n_category);	
		svo.setN_title(n_title);
		
		int listCnt = noticeDao.getNoticeListCnt(svo);  // 페이징 처리를 위해 필요한, 총 게시글 수 계산. ('제목'과 '말머리' 값이 있다면 반영한 결과로)
		
		svo.pageinfo(page, range, listCnt); // 페이징처리를 위해 필수 정보인 '현재페이지', '현재 속한 페이지 범위', '총 게시글 수' 
		
		model.addAttribute("pagination", svo);   // 페이징처리
		model.addAttribute("notice", noticeDao.noticeSearchselect(svo));   // 기존의 단순 공지사항 리스트 대신 페이징처리가 반영된 상태로.
		
		return "user/notice/userNoticeList";
	}
	
	// 사용자단에서 공지사항 조회하기. 조회수 올라가는 작업해야 함
	@RequestMapping("/userNoticeRead.do")
	public String userNoticeRead(Model model, HttpServletRequest request, HttpServletResponse response, NoticeVO vo) {
		
			System.out.println("넘겨받은 no의 값: " + request.getParameter("no"));
	
			vo.setN_no(Integer.valueOf(request.getParameter("no")));
			noticeDao.hitUpdate(vo);   // 폼으로 넘어가면서 조회수도 올라가도록
			
			vo = noticeDao.noticeSelect(vo);
			model.addAttribute("notices", vo);
	
			return "user/notice/userNoticeRead";
	}
	
	
	/* =============사용자 마이페이지============ */
	
	
	// 사용자 마이페이지 이동. 그전에 세션값이 없는 회원에겐 '마이페이지'가 노출이 되지 않도록 나중에 수정한다. 
	@RequestMapping("/userMypage.do")
	public String userMypage(HttpServletRequest request, HttpSession session ,MemberVO mvo, Model model) {
		
		// 이메일, 가입유형 세션값을 통해 해당 유저의 모든 정보를 조회해서 마이페이지로 데이터를 넘긴다.
		mvo.setM_email( (String) session.getAttribute("email") );
		mvo.setM_type( (String) session.getAttribute("type"));
		
		System.out.println("세션값 이메일 담겼는지 확인: " + mvo.getM_email());
		System.out.println("세션값 가입유형 담겼는지 확인: " + mvo.getM_type());
		
		model.addAttribute("member", memberDao.mypageSelectList(mvo));
		
		System.out.println("전달되는 얘의 값이 뭘까? : " + memberDao.mypageSelectList(mvo));
		return "user/mypage/mypageMain";
	
	// 사용자 닉네임 변경
	@ResponseBody
	@RequestMapping("/ajaxUpdateNickname.do")
	public String ajaxUpdateNickname(HttpServletRequest request, HttpSession session,  MemberVO mvo) {
		
		System.out.println("ajax로 넘어온, 변경할 닉네임 이름: " + request.getParameter("sendNickname"));
		
		String nickname = request.getParameter("sendNickname");
		
		mvo.setM_nickname(nickname);
		mvo.setM_email( (String) session.getAttribute("email"));
		mvo.setM_type( (String)session.getAttribute("type"));
		
		int n = memberDao.ajaxUpdateNickname(mvo);
		String message = "NO";
		if ( n != 0) {   // 정상적으로 변경된 경우
			message = "YES";
		} 
		
		return message;
	}
	
	// 사용자 비밀번호 변경 팝업 
	@RequestMapping("/passwordPopup.do")
	public String passwordPopup(HttpServletRequest request, Model model) {
		
		return "layouts/updatePassword";
	}
	

	// 비밀번호 확인 체크
	@ResponseBody
	@RequestMapping("/ajaxPassChk.do")
	public String ajaxPassChk(HttpSession session, HttpServletRequest request, MemberVO mvO) {
		
		mvo.setM_email( (String) session.getAttribute("email"));
		System.out.println("현재 세션 이메일 값: " + (String) session.getAttribute("email"));
		mvo.setM_type( (String) session.getAttribute("type")); 
		mvo.setM_password( request.getParameter("sendPwd"));
		
		mvo = memberDao.ajaxPassChk(mvo);
		String message = "NO";
		
		if( mvo != null) {
			message = "YES";   // 패스워드 일치함. 
		}
		
		return message;
	}
	
	// 새로운 비밀번호 변경
	@ResponseBody
	@RequestMapping("/ajaxUpdatePassword.do")
	public String ajaxUpdatePassword(HttpSession session, MemberVO mvo, HttpServletRequest request) {
		
		mvo.setM_email( (String) session.getAttribute("email"));
		mvo.setM_type( (String) session.getAttribute("type"));
		mvo.setM_password( request.getParameter("inputPwd"));
		
		int n = memberDao.ajaxUpdatePassword(mvo);
		
		String message = null;
		if (n != 0) {  //정상적으로 수행된 경우. 
			message = "YES";
		}
		
		return message;
	}
	
	// 연락처 인증 팝업창 호출 
	@RequestMapping("/phoneChkPopup.do")
	public String phoneChkPopup(HttpServletRequest request, Model model) {
		
		return "layouts/updatePhone";
	}
	
	// 연락처 정보 db업데이트
	@ResponseBody
	@RequestMapping("/ajaxUpdatePhone.do")
	public String ajaxUpdatePhone(HttpSession session, HttpServletRequest request, MemberVO mvo) {
		
		mvo.setM_email( (String)session.getAttribute("email"));
		mvo.setM_type( (String) session.getAttribute("type"));
		mvo.setM_phone( request.getParameter("inputPhoneChk"));
		
		int n = memberDao.ajaxUpdatePhone(mvo);
		String message = null;
		
		if( n != 0) {
			message = "YES";
		}
		return message;
	}
}
