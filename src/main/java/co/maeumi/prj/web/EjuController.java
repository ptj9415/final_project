package co.maeumi.prj.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.todayreply.service.TodayreplyService;
import co.maeumi.prj.todayreply.service.TodayreplyVO;
import co.maeumi.prj.todaystory.service.TodaystoryService;
import co.maeumi.prj.todaystory.service.TodaystoryVO;

@Controller
public class EjuController {

	@Autowired
	private TodaystoryService todayDao;

	@Autowired
	private TodayreplyService todayReplyDao;

	/* =====사용자 화면===== */
	
	//사용자 메인화면
	@RequestMapping("/home.do")
	public String home() {
		return "user/home/home";
	}
	
	//개인상담 메인화면 불러오기
	@RequestMapping("/userPersonalCounsel.do")
	public String userPersonalCounsel() {
		return "user/personalcounsel/userPersonalCounsel";
	}
	
	//개인상담 신청 확인내역 
	@RequestMapping("/personalCounselApplication.do")
	public String personalCounselApplication() {
		return "user/personalcounsel/personalCounselApplication";
	}
	
	// 오늘의 한마디 메인화면 
	@RequestMapping("/userTodayStory.do")
	public String userTodayStory(Model model, TodaystoryVO vo, HttpSession session) throws Exception {
		// session.setAttribute("sc_no", sc_no);

		// 오늘의 한마디 주제
		vo = todayDao.TodaySelect(vo);
		todayDao.TodaySelect(vo);
		model.addAttribute("todaySelect", vo);

		// 오늘의 한마디 주제에 따른 댓글
		List<TodayreplyVO> todayReplyList = todayReplyDao.readTodayReply(vo.getSc_no());
		model.addAttribute("todayReplyList", todayReplyList);
		return "user/todaystory/userTodayStory";
	}

	// 오늘의 한마디 댓글 등록
	@RequestMapping("/todayReplyInsert.do")
	public String todayReplyInsert(TodayreplyVO vo, Model model, HttpServletRequest request) {
		model.addAttribute("todayReplyInsertForm", todayReplyDao.todayReplyInsert(vo));
		return "redirect:user/todaystory/userTodayStory";
	}
	// 오늘의 한마디 user 댓글 삭제
	@RequestMapping("/todayReplyDelete.do")
	@ResponseBody
	public String todayReplyDelete(TodayreplyVO vo, HttpServletRequest request) {

		vo.setSr_no(request.getParameter("sr_no"));
		todayReplyDao.todayReplyDelete(vo);

		return "OK";
	}
	
	
	/* ===== 상담사 화면 ===== */
	
	//개인상담 신청내역 메인화면
	@RequestMapping("/counselorPersonalApplyList.do")
	public String personalCounselApplyList() {
		
		return "counselor/personalcounselmanage/counselorPersonalApplyList";
	}
	
	//개인상담 관리 메인화면
	@RequestMapping("/counselorPersonalList.do")
	public String counselorPersonalList() {
		
		return "counselor/personalcounselmanage/counselorPersonalList";
	}
	
	
	

	/* =====관리자 화면===== */
	
	// 오늘의 한마디 메인화면
	@RequestMapping("/adminTodayStoryList.do")
	public String adminTodayStoryList(Model model, TodaystoryVO vo) {
		List<TodaystoryVO> list = todayDao.TodayStorySelectList();
		model.addAttribute("adminTodayStoryList", list);
		return "admin/todaystorymanage/adminTodayStoryList";
	}

	// 오늘의 한마디 등록
	@RequestMapping("/adminTodayStoryRegister.do")
	public String adminTodayStoryRegister(Model model, TodaystoryVO vo) {
		model.addAttribute("adminTodayInsertForm", todayDao.TodayInsert(vo));

		return "redirect:adminTodayStoryList.do";
	}

	// 오늘의 한마디 삭제
	@RequestMapping("/adminTodayStoryDelete.do")
	@ResponseBody
	public String adminTodayStoryDelete(TodaystoryVO vo, Model model, HttpServletRequest request) {
		vo.setSc_no(request.getParameter("sc_no"));
		todayDao.TodayDelete(vo);
		return "ok";
	}

	// 오늘의 한마디 update modal form 호출
	@RequestMapping("/adminTodayStoryUpdateForm.do")
	@ResponseBody
	public String adminTodayStoryUpdateModal(TodaystoryVO vo, Model model, HttpServletRequest request) {
		model.addAttribute("adminTodayStorySelect", todayDao.AdminTodaySelect(vo));
		// System.out.println(vo);
		// System.out.println(todayDao.AdminTodaySelect(vo));
		return "ok";
	}

	// 오늘의 한마디 update 수정
	@RequestMapping("/adminTodayStoryUpdate.do")
	public String adminTodayStoryUpdate(Model model, TodaystoryVO vo, HttpServletRequest request) {
		System.out.println(request.getParameter("sc_title"));
		System.out.println(vo.getSc_no());
		model.addAttribute("adminTodayStoryUpdate", vo);
		todayDao.TodayUpdate(vo);

		return "redirect:adminTodayStoryList.do";

	}
	
	

}
