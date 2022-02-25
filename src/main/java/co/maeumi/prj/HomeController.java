package co.maeumi.prj;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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

	//오늘의 한마디 user
	@RequestMapping("/todayStory.do")
	public String todayStory(Model model, TodayVO vo, HttpSession session) throws Exception {
		// session.setAttribute("sc_no", sc_no);

		// 오늘의 한마디 주제
		vo = todayDao.TodaySelect(vo);
		todayDao.TodaySelect(vo);
		model.addAttribute("todaySelect", vo);

		// 오늘의 한마디 주제에 따른 댓글
		List<TodayReplyVO> todayReplyList = todayReplyDao.readTodayReply(vo.getSc_no());
		model.addAttribute("todayReplyList", todayReplyList);
		return "user/todayStory";
	}

	// 오늘의 한마디 user 댓글 삭제
	@RequestMapping("/todayReplyDelete.do")
	@ResponseBody
	public String todayReplyDelete(TodayReplyVO vo, HttpServletRequest request) {

		vo.setSr_no(request.getParameter("sr_no"));
		todayReplyDao.todayReplyDelete(vo);

		return "OK";
	}

	@RequestMapping("/adminbootstrap.do")
	public String adminbootstrap() {
		return "admin/admin";
	}

	// 오늘의 한마디 admin 

	@RequestMapping("/adminTodayStory.do")
	public String adminTodayStoryList(Model model, TodayVO vo) {
		List<TodayVO> list = todayDao.TodayStorySelectList();
		model.addAttribute("adminTodayStoryList", list);
		return "admin/adminTodayStory";
	}

	// 오늘의 한마디 admin 글 등록
	@RequestMapping("/adminTodayStoryRegister.do")
	public String adminTodayStoryRegister(Model model, TodayVO vo) {
		model.addAttribute("adminTodayInsertForm",todayDao.TodayInsert(vo));
		
		return "redirect:adminTodayStory.do";
	}
	
	
	// 오늘의 한마디 admin 글 삭제
	@RequestMapping("/adminTodayStoryDelete.do")
	@ResponseBody
	public String adminTodayStoryDelete(TodayVO vo, Model model, HttpServletRequest request) {
		vo.setSc_no(request.getParameter("sc_no"));
		todayDao.TodayDelete(vo);
		return "ok";
	}
	
	//오늘의 한마디 admin update modal form 호출
		@RequestMapping("/adminTodayStoryUpdateForm.do")
		@ResponseBody
		public String adminTodayStoryUpdateModal(TodayVO vo, Model model, HttpServletRequest request) {
			model.addAttribute("adminTodayStorySelect",todayDao.AdminTodaySelect(vo));
		//	System.out.println(vo);
		//	System.out.println(todayDao.AdminTodaySelect(vo));
			return "ok";
		}
		
	//오늘의 한마디 admin update 글 수정
		@RequestMapping("/adminTodayStoryUpdate.do")
		public String adminTodayStoryUpdate(Model model, TodayVO vo, HttpServletRequest request) {
			System.out.println(request.getParameter("sc_title"));
			System.out.println(vo.getSc_no());
			model.addAttribute("adminTodayStoryUpdate",vo);
			todayDao.TodayUpdate(vo);
			
			return "redirect:adminTodayStory.do";
			
		}
}
