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

	// 상담 관리 - 개인상담 신청내역 화면
	@RequestMapping("/personalcounsel.do")
	public String personalcounsel(Model model) {
		return "counselor/myintro";
	}

	// 상담 관리 - 개인상담 관리 화면
	@RequestMapping("/personalcounselmanage.do")
	public String personalcounselmanage(Model model) {
		return "counselor/personalcounselmanage";
	}

	// 상담 관리 - 그룹상담 개설 화면
	@RequestMapping("/groupcounselopen.do")
	public String groupcounselopen(Model model) {
		return "counselor/groupcounselopen";
	}

	// 상담 관리 - 그룹상담 관리 화면
	@RequestMapping("/groupcounselmanage.do")
	public String groupcounselmanage(Model model) {
		return "counselor/groupcounselmanage.do";
	}

	// 상담사 마이페이지
	@RequestMapping("/counselormypage.do")
	public String adminhome(Model model, CounselorVO vo, HttpSession session) {
//			String c_email = (String)session.getAttribute("email");
		String c_email = "3244509@naver.com";
		session.setAttribute("email", c_email);
		session.setAttribute("name", "상담사");
		vo.setC_email(c_email);

		model.addAttribute("counselor", counselorDao.counselorSelect(vo));
		return "counselor/counselormypage";
	}

	// 상담사 마이페이지 - 프로필 사진 변경
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

	// 상담사 마이페이지 - 내 정보 수정 / 상담사 등급 변경 신청 화면
	@RequestMapping("/counselorinfo.do")
	public String counselorinfo(Model model) {
		return "counselor/counselorinfo";
	}

	// 상담사 마이페이지 - 상담 경력 수정 화면
	@RequestMapping("/mycareer.do")
	public String mycareer(Model model) {
		return "counselor/mycareer";
	}

	// 상담사 마이페이지 - 자격사항 수정 화면
	@RequestMapping("/mycertification.do")
	public String mycertification(Model model) {
		return "counselor/mycertification";
	}

	// 상담사 마이페이지 - 내 상담시간 수정 화면
	@RequestMapping("/mycounseltime.do")
	public String mycounseltime(Model model) {
		return "counselor/mycounseltime";
	}

	// 상담사 마이페이지 - 상담사 소개 수정 화면
	@RequestMapping("/myintro.do")
	public String myintro(Model model) {
		return "counselor/myintro";
	}
}
