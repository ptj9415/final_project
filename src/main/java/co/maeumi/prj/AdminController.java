package co.maeumi.prj;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import co.maeumi.prj.pagination.Search;
import co.maeumi.prj.service.MemberService;

@Controller
public class AdminController {
	@Autowired
	private MemberService memberDao;
	
	@RequestMapping(value = "membermanage.do")
	public String memberManage(Model model
			,@RequestParam(required = false, defaultValue = "1") int page
			,@RequestParam(required = false, defaultValue = "1") int range
			,@RequestParam(required = false) String m_nickname
			,@RequestParam(required = false) String m_email
			,@RequestParam(required = false) String m_phone
			,@RequestParam(required = false, defaultValue = "all") String m_type
			,@ModelAttribute("search") Search svo
			) throws Exception {
		
		
		model.addAttribute("search", svo);
		svo.setM_email(m_email);
		svo.setM_nickname(m_nickname);
		svo.setM_type(m_type);
		svo.setM_phone(m_phone);		

		int listCnt = memberDao.getMemberListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		model.addAttribute("member", memberDao.memberSearchselect(svo));

		return "admin/membermanage";
	}

}
