package co.maeumi.prj.personalCounsel.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PersonalCounselController {
	
	@RequestMapping("/personalCounsel.do")
	public String personalCounsel() {
		return "user/personalCounsel";
	}
}
