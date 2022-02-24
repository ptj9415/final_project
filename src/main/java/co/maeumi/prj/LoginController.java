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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	

	// 로그인하는 페이지로 이동
	@RequestMapping("/loginForm.do")
	public String loginForm(Model model) {
		return "user/loginForm";
	}

	// 로그인 처리
	@PostMapping("/login.do")
	public String login(Model model, HttpServletRequest request, MemberVO mvo, HttpSession session, CounselorVO cvo) {
		
		mvo.setM_email(request.getParameter("email"));
		mvo.setM_password(request.getParameter("password"));
		mvo = memberDao.memberLogin(mvo);
		String message = null;
		

		if (mvo != null) {
			session.setAttribute("user"	, request.getParameter("email"));
			System.out.println("로그인하면서 내가 담은 세션값 이름 : " + session.getAttribute("user"));
		} else {
			cvo.setC_email(request.getParameter("email"));
			cvo.setC_password(request.getParameter("password"));
			cvo = counselorDao.counselorLogin(cvo);
			
			if(cvo != null) {
				session.setAttribute("user", request.getParameter("email"));
				System.out.println("세션에 담았던 거." + session.getAttribute("user"));
			} else {
				message = "로그인에 실패했습니다. 이메일 또는 비밀번호를 확인해주세요.";
				System.out.println(message);
			}
		}
		model.addAttribute("message", message);
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
	public String kakaoLogin(@RequestParam(value = "code", required = false) String code, Model model, MemberVO mvo)
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
		System.out.println("실행1");
		String k_email = (String) userInfo.get("email");
		String k_nickname = (String) userInfo.get("nickname");
		System.out.println("실행2");
		System.out.println(k_email);
		System.out.println(k_nickname);
		String message = null;
		/*
		 * 최초 로그인의 경우, DB에 정보를 insert하고 home/home으로 가게하고, 재로그인의 경우 email 존재여부 체크만 하고,
		 * 존재하면 바로 home/home으로. 일반유형으로 회원가입 했거나, 네이버로 로그인 했다면 같은 이메일로 접근 안 된다고 할 것.
		 */
		MemberVO mvo2 = new MemberVO(); // 존재유무 체크용으로 임의의 dto인스턴스 생성.
		mvo2.setM_email(k_email);
		System.out.println("mvo객체에 담은 email의 값:  " + mvo2.getM_email());
		mvo2 = memberDao.memberSelect(mvo2);

		if (mvo2 == null) {
			mvo.setM_email(k_email);
			mvo.setM_nickname(k_nickname);
			mvo.setM_type("KAKAO");
			mvo.setM_password("");
			mvo.setM_phone("");
			int n = memberDao.memberInsert(mvo);
			if (n != 0) { // insert이의 결과.
				message = mvo.getM_nickname();
				return "home/home";
			} else { // insert가 실패한 경우.
				message = "null이었는데, 왜 insert가 안 되었지?";
				System.out.println(message);
				return "home/loginForm";
			}
		}
		return "home/home";
	} // 카카오로그인

	
	
	
	/* -----------네이버 로그인 부분 시작.---------------- */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;

	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	// 로그인 첫 화면 요청 메소드
	@RequestMapping(value = "/naverLogin.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String naverLogin(Model model, HttpSession session) {

		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		System.out.println("네이버:" + naverAuthUrl);

		// 네이버
		model.addAttribute("url", naverAuthUrl);

		/* 생성한 인증 URL을 View로 전달 */
		return "user/naverLogin";
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
		
		session.setAttribute("user", "naver");  // header용.
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
		
		
		MemberVO mvo2 = new MemberVO();
		mvo2.setM_email((String)response.get("email"));
		mvo2 = memberDao.memberSelect(mvo2);
		
		if(mvo2 == null) {
			mvo.setM_email((String)response.get("email"));
			mvo.setM_nickname((String)response.get("nickname"));
			mvo.setM_phone((String)response.get("mobile"));
			mvo.setM_password("");
			mvo.setM_type("NAVER");
			int n = memberDao.memberInsert(mvo);
			if(n != 0) {
				message = (String)response.get("email");
				System.out.println(message + " 님 네이버 로그인 성공" );
				return "home/home";
			} else {
				message = "실패햇다.....";
				System.out.println(message);
				return "home/loginForm";
			}
		}	
		return "home/home";  /* 네이버 로그인 성공 페이지 View 호출 */
	}

}
