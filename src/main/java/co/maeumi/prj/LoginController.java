package co.maeumi.prj;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.service.KakaoService;
import co.maeumi.prj.service.MemberService;
import co.maeumi.prj.service.MemberVO;
import co.maeumi.prj.service.NaverLoginBO;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberDao;
	@Autowired
	private CounselorService counselorDao;
	

	/* -----------네이버 로그인  관련  시작.---------------- */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;	
	}	
	
	// 로그인하는 페이지로 이동
	@RequestMapping("/loginForm.do")
	public String loginForm(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("네이버 :" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		/* 생성한 인증 URL을 View로 전달 */
		
		return "user/loginForm";
	}
	
	
	// 네이버 로그인 성공시 callback호출 메소드
		@RequestMapping(value = "/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
		public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session, MemberVO mvo)
				throws IOException, ParseException {
			
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
			JSONObject jsonObject = (JSONObject)jsonParser.parse(naverLoginBO.getUserProfile(oauthToken).toString());
			
			JSONObject response = (JSONObject)jsonObject.get("response");
			
			System.out.println("이것은: " + jsonObject.get("response"));
			System.out.println("이메일은: " + (String)response.get("email"));
			System.out.println("닉네임은: " + (String)response.get("nickname"));
			System.out.println("연락처는 선택이지만 : " + (String)response.get("mobile"));
			
			
			MemberVO mvo2 = new MemberVO(); // 기존에 존재유무 판단하기 위한 용도의 인스턴스 생성.
			mvo2.setM_email((String)response.get("email"));
			mvo2.setM_type("네이버");
			mvo2 = memberDao.naverSelect(mvo2);
			
			if(mvo2 == null) {   // db에 해당 유저의 정보가 없다면.
				mvo.setM_email((String)response.get("email"));
				mvo.setM_nickname((String)response.get("nickname"));
				String beforePhone = (String)response.get("mobile");
				String realPhone = beforePhone.replaceAll("-", "");
				mvo.setM_phone(realPhone);
				mvo.setM_password("");
				mvo.setM_type("네이버");
				int n = memberDao.memberInsert(mvo);
				if(n != 0) {
					message = (String)response.get("email");
					System.out.println(message + " 님 네이버 로그인 성공" );
					session.setAttribute("email", message); // 세션값 설정
					session.setAttribute("nickname", (String)response.get("nickname"));
					return "home/home";
				} else {
					message = "실패햇다.....";
					System.out.println(message);
					return "home/loginForm";
				}
			}
			// null이 아니었다면 바로 db에 데이터를 넣을 필요없이 바로 로그인 
			session.setAttribute("email", (String)response.get("email")); // 세션값 설정
			session.setAttribute("nickname", (String)response.get("nickname"));
			System.out.println("네이버 로그인으로 담은 세션값1 email: " +  (String)response.get("email") );
			System.out.println("네이버 로그인으로 담은 세션2 nickname: " + (String)response.get("nickname"));
			return "home/home";  
		}
	
	
	// 일반 로그인 처리
	@ResponseBody
	@RequestMapping(value = "/login.do", method =  RequestMethod.POST)
	public String login(Model model, HttpServletRequest request, MemberVO mvo, HttpSession session, CounselorVO cvo) {
		
		mvo.setM_email(request.getParameter("email"));
		mvo.setM_password(request.getParameter("password"));
		mvo = memberDao.memberLogin(mvo);
		
		String message = "";
		if (mvo != null) {   // 멤버로 로그인 성공한 경우~
			session.setAttribute("email", request.getParameter("email"));
			session.setAttribute("nickname", mvo.getM_nickname());
			System.out.println("로그인 성공");
			System.out.println("로그인하면서 내가 담은 세션값 이름 : " + session.getAttribute("email"));
			System.out.println("로그인 하면서 닉네임이 담겼나??? 확인. 제발. " +  session.getAttribute("nickname"));
			message = "YES";
		} else {
			cvo.setC_email(request.getParameter("email"));
			cvo.setC_password(request.getParameter("password"));
			cvo = counselorDao.counselorLogin(cvo);
			
			if(cvo != null) {  // 상담사로 로그인 성공한 경우. 
				session.setAttribute("email", request.getParameter("email"));
				System.out.println("세션에 이메일이 담겼나? " + session.getAttribute("email"));
				message = "YES";
			} else {   // 일반회원, 상담사 둘 다 로그인 실패한 경우.
				message = "NO";
			}
		}
		
		return message;
	}
	@RequestMapping("/loginSuccess.do")
	public String loginSuccess(Model model, HttpServletRequest request) {
		return "home/home";
	}
	
	// 로그아웃 처리
	@RequestMapping("/logout.do")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) {
		
		
		System.out.println("로그아웃 하면서 내가 지울 세션값 이름: " + session);
		session.invalidate();
		return "home/home";
	}

	@Autowired
	private KakaoService ks;

	// 카카오 로그인 컨트롤러. code를 받을 메서드.
	@RequestMapping(value = "/kakaoLogin.do", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, MemberVO mvo, HttpSession session)
			throws Exception {

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
		
		//MemberVO mvo2 = new MemberVO(); // 존재유무 체크용으로 임의의 dto인스턴스 생성.
		mvo.setM_email(k_email);
		mvo.setM_type("카카오");
		System.out.println("mvo객체에 담긴 email의 값:  " + mvo.getM_email());
		System.out.println("mvo객체에 담긴 type의 값. " + mvo.getM_type());
		mvo = memberDao.kakaoSelect(mvo);   // 이메일과 가입유형 둘 다 판단 => 이메일 중복 피하기 위함. 

		MemberVO mvo2 = new MemberVO();
		if (mvo == null) {     //여기까지 mvo2였음.
			mvo2.setM_email(k_email);
			mvo2.setM_nickname(k_nickname);
			mvo2.setM_type("카카오");
			mvo2.setM_password("");
			mvo2.setM_phone("");
			int n = memberDao.memberInsert(mvo2);
			if (n != 0) { // insert 결과 성공이면,
				session.setAttribute("email", mvo2.getM_nickname()); //세션값 담아주고 홈으로. 
				return "home/home";
			} else { // insert가 실패한 경우.
				System.out.println("에러발생"); // 에러발생하면 로그인화면으로 다시. 
				return "home/loginForm";
			}
		} 
		// mvo가 null이 아닌 경우, 즉 이미 해당 아이디와 유형이 존재히면~
		mvo2.setM_email(k_email); // 세션값을 이용하기 위함. 
		mvo2.setM_nickname(k_nickname);  // 세션값을 통해 header메뉴 동적으로 보여주기 위하여 
		session.setAttribute("email", mvo2.getM_nickname());
		session.setAttribute("nickname", mvo2.getM_nickname());
		System.out.println("로그인 성공으로 담은 세션값 " + mvo2.getM_email());
		System.out.println("로그인 성공으로 담은 세션값 2 : " + mvo2.getM_nickname());
		return "home/home";
	} // 카카오로그인
	
	
	@RequestMapping("/findEmailPopup.do")
	public String findEmailPopup(Model model, HttpServletRequest request) {
		
		return "user/popup/findEmail";
	};
	

	
	
	
	

	

	

}
