package co.maeumi.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import co.maeumi.prj.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping(value = "/homes.do", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("member", memberDao.memberSelectList());
		return "home";
	}
	@RequestMapping("/home.do")
	public String home1(Model model) {
		return "home/home";
	}
	
}
