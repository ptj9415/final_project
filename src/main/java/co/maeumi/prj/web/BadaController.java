package co.maeumi.prj.web;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.scribejava.core.model.OAuth2AccessToken;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.member.service.MemberService;
import co.maeumi.prj.member.service.MemberVO;
import co.maeumi.prj.notice.service.NoticeService;
import co.maeumi.prj.notice.service.NoticeVO;
import co.maeumi.prj.service.CoolsmsService;
import co.maeumi.prj.service.KakaoService;
import co.maeumi.prj.service.NaverLoginBO;

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
	
	//상담사 회원가입 양식 화면
	@RequestMapping("/counselorJoinForm.do")
	public String counselorJoinForm(Model model, HttpServletRequest request) {
		model.addAttribute("c_email", request.getParameter("inputEmail"));
		return "user/login/counselorJoinForm";
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
				System.out.println("로그인 성공");
				System.out.println("로그인하면서 내가 담은 세션값 이름 : " + session.getAttribute("email"));
				System.out.println("로그인 하면서 닉네임이 담겼나??? 확인. 제발. " + session.getAttribute("nickname"));
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
			if (mvo == null) { // 여기까지 mvo2였음.
				mvo2.setM_email(k_email);
				mvo2.setM_nickname(k_nickname);
				mvo2.setM_type("카카오");
				mvo2.setM_password("");
				mvo2.setM_phone("");
				int n = memberDao.memberInsert(mvo2);
				if (n != 0) { // insert 결과 성공이면,
					session.setAttribute("email", mvo2.getM_nickname()); // 세션값 담아주고 홈으로.
					return "home/home";
				} else { // insert가 실패한 경우.
					System.out.println("에러발생"); // 에러발생하면 로그인화면으로 다시.
					return "user/login/loginForm";
				}
			}
			// mvo가 null이 아닌 경우, 즉 이미 해당 아이디와 유형이 존재히면~
			mvo2.setM_email(k_email); // 세션값을 이용하기 위함.
			mvo2.setM_nickname(k_nickname); // 세션값을 통해 header메뉴 동적으로 보여주기 위하여
			session.setAttribute("email", mvo2.getM_nickname());
			session.setAttribute("nickname", mvo2.getM_nickname());
			System.out.println("로그인 성공으로 담은 세션값 " + mvo2.getM_email());
			System.out.println("로그인 성공으로 담은 세션값 2 : " + mvo2.getM_nickname());
			return "home/home";
		} // 카카오로그인

		@RequestMapping("/findEmailPopup.do")
		public String findEmailPopup(Model model, HttpServletRequest request) {

			return "user/login/findEmail";
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

		// 이메일 중복체크
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

//					// 이메일 보내기. 주석 삭제하면 실제 이메일 날라감. ( 변수를 선언해서 이메일 전송에 필요로 한 데이터를 할당한다.) 
//					String setFrom = "yd23fp@gmail.com";  // root-context.xml에 작성한 자신의 이메일 계정. 아이디랑 메일주소 모두 입력!
//					String toMail = inputEmail;					// 수신받을 이메일. view로부터 받은 이메일 주소인 변수 email을 사용
//					String title = "회원가입 인증 이메일 입니다.";  // 자신이 보낼 이메일 제목
//					String content = 						// 자신이 보낼 이메일 내용
//							"Maeumi 에 방문해주셔서 감사ㅎㅎ" +
//							"<br><br>" +
//							"인증번호는 " + checkNum + " << 이거. " +
//							"<br>" +
//							"해당 인증번호를 인증번호 확인란에 입력해~ ";
//					
//					try  {
//						MimeMessage message = mailSender.createMimeMessage();
//						MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
//						helper.setFrom(setFrom);
//						helper.setTo(toMail);
//						helper.setSubject(title);
//						helper.setText(content, true);
//						mailSender.send(message);
//						
//					} catch (Exception e ) {
//						e.printStackTrace();
//					}

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

		@PostMapping("/memberJoin.do")
		public String memberJoin(HttpServletRequest request, Model model, MemberVO mvo) {
			mvo.setM_email(request.getParameter("email"));
			mvo.setM_nickname(request.getParameter("nickname"));
			mvo.setM_password(request.getParameter("password"));
			mvo.setM_phone(request.getParameter("phone"));
			mvo.setM_type(request.getParameter("type"));

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
		
		

	/* ===== 관리자 화면 ===== */

	@RequestMapping("/adminNoticeList.do")
	public String adminNoticeList(HttpSession session, HttpServletRequest request, Model model) {

		model.addAttribute("notices", noticeDao.noticeSelectList()); // 게시글 전체 가져오는지 조회.

		return "admin/noticemanage/adminNoticeList";
	}

	@RequestMapping("/adminNoticeForm.do")
	public String adminNoticeForm(Model model, HttpServletRequest request, HttpSession session) {

		return "admin/noticemanage/adminNoticeForm";
	}

	// ckupload
	@RequestMapping("/imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response,
			@RequestParam MultipartFile upload) // view단에서 업로드한 파일이 'upload'에 담기게 된다.
			throws Exception {

		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		OutputStream out = null;
		PrintWriter printWriter = null;
		String fileName = upload.getOriginalFilename(); // 업로드한 파일 이름
		byte[] bytes = upload.getBytes(); // 파일을 바이트 배열로 만든다.
		ServletContext application = request.getSession().getServletContext();
		String uploadPath = application.getRealPath("/resources/ckUpload"); // 업로드 될 공간.
		out = new FileOutputStream(new File(uploadPath + fileName));
		out.write(bytes); // 배포 경로에 파일이 저장된다.
		printWriter = response.getWriter(); // 웹브라우저에 출력해주기 위한 객체.
		String fileUrl = request.getContextPath() + "/images/" + fileName;
		printWriter.println("{\"filename\":\"" + fileName + "\",\"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
		printWriter.flush();
	}

	@RequestMapping("/noticeRegister.do")
	public String noticeRegister(Model model, NoticeVO vo, HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {

		// 파라미터값 넘어왔는지 확인. 이 값들을 테이블에 집어넣을 생각.
		System.out.println("title은 " + request.getParameter("title"));
		System.out.println("말머리 : " + request.getParameter("category"));
		System.out.println("내용 : " + request.getParameter("content"));
		System.out.println("첨부파일: " + request.getParameter("fileName"));
		System.out.println("작성자: " + request.getParameter("writer"));
		System.out.println("작성일: " + request.getParameter("wdate"));

		// insert구문. 첨부파일 있으면 첨부파일도.
		vo.setN_writer(request.getParameter("writer"));
		vo.setN_title(request.getParameter("title"));
		vo.setN_content(request.getParameter("content"));
		vo.setN_filename(request.getParameter("fileName"));
		vo.setN_category(request.getParameter("category"));
		vo.setN_writedate(request.getParameter("wdate"));
		vo.setN_pfilename(request.getParameter("pfileName"));
		vo.setN_writedate(request.getParameter("wdate"));

		vo.setN_writer((String) session.getAttribute("email"));
		noticeDao.noticeInsert(vo);

		return "redirect:adminNoticeList.do";
	}

//	@ResponseBody
//	@RequestMapping("/noticeDelete.do")
//	public String noticeDelete(HttpServletRequest request, Model model, NoticeVO vo) {
//		
//		System.out.println("넘어온 값: " + request.getParameter("deleteNum"));
//		
//		vo.setN_no(request.getParameter("deleteNum"));
//		int n  =noticeDao.noticeDelete(vo);
//		String responseText = null;
//		
//		if(n !=0) {
//			responseText = "YES";
//			System.out.println("성공~~");
//		} else {
//			System.out.println("실패");
//		}
//		
//		return responseText;
//		
//	}
}
