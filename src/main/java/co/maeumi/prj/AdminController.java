package co.maeumi.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import co.maeumi.prj.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private MemberService memberDao;

	@RequestMapping("/membermanage.do")
	public String membermanage(Model model) {
		return "admin/membermanage";
	}
	
}
