package co.maeumi.prj.personalCounsel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalCounselController {
	
	
	//개인상담 페이지 불러오기
	@RequestMapping("/personalCounsel.do")
	public String personalCounsel() {
		return "user/personalCounsel";
	}
}
