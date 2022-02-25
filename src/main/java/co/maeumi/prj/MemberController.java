package co.maeumi.prj;

import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.service.CoolsmsService;
import co.maeumi.prj.service.MemberService;
import co.maeumi.prj.service.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberDao;
	@Autowired
	private CounselorService counselorDao;
	
	// root-context.xml에서 등록했던 mailSender bean을 의존성 주입ㄱㄱ
	@Autowired
	private JavaMailSender mailSender;
	
	MemberVO mvo = new MemberVO();
	
	// 이메일 인증화면으로 이동
	@RequestMapping("/emailCheck.do")
	public String emailCheck(Model model) {
		return "user/emailCheck";
	}
	
	// 일반회원 약관동의 화면 
	@RequestMapping("/termsCheck.do")
	public String termsCheck(Model model, HttpServletRequest request) {
		return "user/termsCheck";
	}
	
	// 이메일 중복체크
	@PostMapping("/ajaxEmailCheck.do")
	@ResponseBody
	public String ajaxEmailCheck(HttpServletRequest request, Model model) {
		mvo.setM_email(request.getParameter("chkEmail"));
		boolean b = memberDao.memberEmailCheck(mvo);
		String check = "0";
		if(b) {    // 중복 이메일이 존재하는 경우. 
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
				
				
//				// 이메일 보내기. 주석 삭제하면 실제 이메일 날라감. ( 변수를 선언해서 이메일 전송에 필요로 한 데이터를 할당한다.) 
//				String setFrom = "yd23fp@gmail.com";  // root-context.xml에 작성한 자신의 이메일 계정. 아이디랑 메일주소 모두 입력!
//				String toMail = inputEmail;					// 수신받을 이메일. view로부터 받은 이메일 주소인 변수 email을 사용
//				String title = "회원가입 인증 이메일 입니다.";  // 자신이 보낼 이메일 제목
//				String content = 						// 자신이 보낼 이메일 내용
//						"Maeumi 에 방문해주셔서 감사ㅎㅎ" +
//						"<br><br>" +
//						"인증번호는 " + checkNum + " << 이거. " +
//						"<br>" +
//						"해당 인증번호를 인증번호 확인란에 입력해~ ";
//				
//				try  {
//					MimeMessage message = mailSender.createMimeMessage();
//					MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
//					helper.setFrom(setFrom);
//					helper.setTo(toMail);
//					helper.setSubject(title);
//					helper.setText(content, true);
//					mailSender.send(message);
//					
//				} catch (Exception e ) {
//					e.printStackTrace();
//				}
				
				
				// 생성한 인증번호 변수를 view로 반환. 생성한 인증번호의 경우 int 타입. ajax를 통한 요청으로 인해 view로 다시 반환할 때 데이터 타입은 String만 가능. 
				String num = Integer.toString(checkNum); // return타입도 void에서 String으로 수정. 테스트는 끝났으니깐. 
				return num;  // ajax를 요청한 view페이지로 num데이터(인증번호)를 전달한다. => 해당 view의 ajax구문으로 ㄱㄱ
	}
	

	// 멤버 회원가입 페이지로 이동
	@RequestMapping("/memberJoinForm.do") 
	public String memberJoinForm(Model model, HttpServletRequest request) {
		
		System.out.println(request.getParameter("inputEmail"));
		model.addAttribute("m_email",request.getParameter("inputEmail"));
		return "user/memberJoinForm";
	}
	
	// 닉네임 중복체크
	@PostMapping("/ajaxNicknameCheck.do")
	@ResponseBody
	public String ajaxNicknameCheck( HttpServletRequest request, Model model) {
		//MemberVO mvo = new MemberVO();
		mvo.setM_nickname( request.getParameter("chkNickname"));
		boolean b = memberDao.memberNicknameCheck(mvo);	
		String check = "0";  // ajax 호출한 곳으로 결과를 보내기 위한 용도.
		if(b) { // 존재하는 경우.
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
		if(n !=0) {
			joinMessage = mvo.getM_nickname();
		} 
		
		model.addAttribute("message", joinMessage);
		return "user/welcomeJoin";
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
		System.out.println("폼에서 넘어온 휴대폰 번호" +  checkPhone);
		mvo.setM_phone(checkPhone);
		mvo.setM_type("MAEUMI");
		mvo = memberDao.memberFindEmail(mvo);
		
		String responseText = null;
		if(mvo != null) {
			String email = mvo.getM_email();
			String type = mvo.getM_type();
			responseText = "조회된 Email은 " + email + ", 가입경로는 " + type;
			System.out.println("멤버에 존재: " + responseText);
		} else  {
			cvo.setC_phone(checkPhone);
			cvo = counselorDao.counselorFindEmail(cvo);
			if(cvo != null) {
				String email = cvo.getC_email();
				responseText = "상담사님의 email은  " + email + " 입니다. ";
				System.out.println("상담사에 존재: " + responseText);
			} else {
				responseText = "NO";
			}
		}
		return responseText;
		
		
	}

	
	
}
