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
	@RequestMapping(value = "/memberPictures.do", produces = "application/text; charset=utf8")
	public String memberPictures(CounselorVO vo, @RequestParam(value = "filename") MultipartFile mf, Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String SAVE_PATH = "src/main/webapp/img/counselorpicture";
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID를 통해서 물리파일명 만들기.

		String msaveFile = SAVE_PATH + uuid + originalFileName; // 원본 확장자명을 찾아서 붙여준다.
		System.out.println(originalFileName);
		String saveFile = uuid + originalFileName;
		System.out.println(saveFile);
		System.out.println(msaveFile);
		vo.setC_picture(originalFileName);
		vo.setC_picturepath(saveFile);

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
}
