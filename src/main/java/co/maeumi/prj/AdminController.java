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
		
		//검색
		model.addAttribute("search", svo);
		svo.setM_email(m_email);
		svo.setM_nickname(m_nickname);
		svo.setM_type(m_type);
		svo.setM_phone(m_phone);
		
		// 전체 유저수를 얻어와 listCnt에 저장
		int listCnt = memberDao.getMemberListCnt(svo);

		//검색
		svo.pageinfo(page, range, listCnt);
		//페이징
		model.addAttribute("pagination", svo);
		//목록 보여주기
		model.addAttribute("member", memberDao.memberSearchselect(svo));

		return "admin/membermanage";
	}

}
