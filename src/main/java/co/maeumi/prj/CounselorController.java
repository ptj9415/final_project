package co.maeumi.prj;

import java.io.File;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;

@Controller
public class CounselorController {
	@Autowired
	private CounselorService counselorDao;



	@RequestMapping("/counselormypage.do")
	public String adminhome(Model model, CounselorVO vo, HttpSession session) {
//		String c_email = (String)session.getAttribute("email");
		String c_email = "3244509@naver.com";
		vo.setC_email(c_email);		

		model.addAttribute("counselor", counselorDao.counselorSelect(vo));
		return "counselor/counselormypage";
	}

	@RequestMapping("/counselorinfo.do")
	public String counselorinfo(Model model) {
		return "counselor/counselorinfo";
	}

	@RequestMapping("/mycareer.do")
	public String mycareer(Model model) {
		return "counselor/mycareer";
	}

	@RequestMapping("/mycertification.do")
	public String mycertification(Model model) {
		return "counselor/mycertification";
	}

	@RequestMapping("/mycounseltime.do")
	public String mycounseltime(Model model) {
		return "counselor/mycounseltime";
	}

	@RequestMapping("/myintro.do")
	public String myintro(Model model) {
		return "counselor/myintro";
	}

	@ResponseBody
	@RequestMapping(value = "/counselorPicture.do", produces = "application/text; charset=utf8")
	public String memberPictures(CounselorVO vo, @RequestParam(value = "filename") MultipartFile mf, Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String SAVE_PATH = "C:\\Users\\admin\\git\\final_project\\src\\main\\webapp\\img\\counselorpicture\\";
		System.out.println(SAVE_PATH);
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID를 통해서 물리파일명 만들기.

		
		
		String msaveFile = SAVE_PATH + uuid + originalFileName; // 원본 확장자명을 찾아서 붙여준다.
		System.out.println(originalFileName);
		String saveFile = uuid + originalFileName;
		System.out.println(saveFile);
		System.out.println(msaveFile);
		vo.setC_picture(originalFileName);
		vo.setC_picturepath(saveFile);
		vo.setC_email("3244509@naver.com");
		try {
			mf.transferTo(new File(msaveFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		counselorDao.counselorPictureUpdate(vo);
		return "img/" + saveFile;
	}
	
	@RequestMapping("/cEmailCheck.do")
	public String cEmailCheck(Model model) {
		return "counselor/cEmailCheck";
	}
	
	@RequestMapping("/counselorJoinForm.do")
	public String counselorJoinForm(Model model, HttpServletRequest request) {
		
		System.out.println(request.getParameter("inputEmail"));
		model.addAttribute("c_email",request.getParameter("inputEmail"));
		return "counselor/counselorJoinForm";
	}
	
	@PostMapping("/counselorJoin.do")
	public String counselorJoin(HttpServletRequest request, Model model, CounselorVO cvo) {
		
		System.out.println("이메일:  " + request.getParameter("email"));
		System.out.println("이름:   " + request.getParameter("name"));
		System.out.println("생년월일:   " +request.getParameter("birthdate"));
		System.out.println("성별:   " +request.getParameter("gender"));
		System.out.println("비밀번호:   " +request.getParameter("password"));
		System.out.println("연락처:   " +request.getParameter("phone"));
		System.out.println("주소:   " +request.getParameter("address"));
		
		cvo.setC_email(request.getParameter("email"));
		cvo.setC_name(request.getParameter("name"));
		cvo.setC_birthdate(request.getParameter("birthdate"));
		cvo.setC_gender(request.getParameter("gender"));
		cvo.setC_phone(request.getParameter("phone"));
		cvo.setC_address(request.getParameter("address"));
		cvo.setC_password(request.getParameter("password"));
		cvo.setC_grade("승인대기");
		
		counselorDao.counselorInsert(cvo);
		model.addAttribute("counselor", request.getParameter("name") + " 님 반갑습니다. ");
		return "counselor/cWelcomeJoin";
		
	}
	
	@RequestMapping("/cLoginForm.do")
	public String cLoginForm(HttpServletRequest request, Model model) {
		return "counselor/cLoginForm";
	}
	
	
	@PostMapping("/cLogin.do")
	public String cLogin(HttpServletRequest request, Model model, HttpSession session, CounselorVO cvo) {
		
		cvo.setC_email(request.getParameter("email"));
		cvo.setC_password(request.getParameter("password"));
		cvo = counselorDao.counselorLogin(cvo);
		String message = null;
		
		if(cvo != null) {
			session.setAttribute("user", request.getParameter("email"));
			System.out.println("세션에 담았던 거." + session.getAttribute("user"));
		} else {
			message = "로그인에 실패했습니다. 이메일 또는 비밀번호를 확인해주세요.";
			System.out.println(message);
		}
		model.addAttribute("messaage", message);
		return "home/home";
		
		
	}
}
