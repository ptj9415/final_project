package co.maeumi.prj;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import co.maeumi.prj.service.MemberService;
import co.maeumi.prj.today.service.TodayService;
import co.maeumi.prj.today.service.TodayVO;
import co.maeumi.prj.todayReply.service.TodayReplyService;
import co.maeumi.prj.todayReply.service.TodayReplyVO;

@Controller
public class HomeController {
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private TodayService todayDao;
	@Autowired
	private TodayReplyService todayReplyDao;

	@RequestMapping(value = "/homes.do", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("member", memberDao.memberSelectList());
		return "home";
	}

	@RequestMapping("/home.do")
	public String home1(Model model) {
		return "home/home";
	}
	@RequestMapping("/admin.do")
	public String adminhome(Model model) {
		return "admin/admin";
	}
	
	@RequestMapping("/todayStory.do")
	public String todayStory(Model model, TodayVO vo, HttpSession session )throws Exception {
		//session.setAttribute("sc_no", sc_no);
		
		//오늘의 한마디 주제
		vo = todayDao.TodaySelect(vo);
		todayDao.TodaySelect(vo);
		model.addAttribute("todaySelect", vo);
		
		//오늘의 한마디 주제에 따른 댓글
		List<TodayReplyVO> todayReplyList = todayReplyDao.readTodayReply(vo.getSc_no());
		model.addAttribute("todayReplyList",todayReplyList);
		return "user/todayStory";
	}
	
	
	@RequestMapping("/adminbootstrap.do")
	public String adminbootstrap(){
		return "admin/admin";
	}	
}
