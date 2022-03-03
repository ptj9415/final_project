package co.maeumi.prj.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.board.service.BoardService;
import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.faq.service.FaqService;
import co.maeumi.prj.faq.service.FaqVO;
import co.maeumi.prj.service.Search;

@Controller
public class EunsolController {

	// F&Q
	@Autowired
	private FaqService faqDao;

	// 자유게시판
	@Autowired
	private BoardService boardDao;

	
	/* ===== 사용자 화면 ===== */
	
	// 사용자 FAQ 메인화면
	@RequestMapping("/userFaq.do")
	public String userFaq(FaqVO vo, Model model) {
		List<FaqVO> list = faqDao.faqSelectList();
		model.addAttribute("faqs", list);
		return "user/faq/userFaq";
	}
	

	// 사용자 자유게시판 메인화면
	@RequestMapping("/userBoardList.do")
	public String userBoardList(BoardVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String b_email, @RequestParam(required = false) String b_title,
			@RequestParam(required = false) String b_subject,
			@RequestParam(required = false, defaultValue = "all") String b_wdate, @ModelAttribute("search") Search svo)
			throws Exception {

		model.addAttribute("search", svo);
		svo.setB_email(b_email);
		svo.setB_title(b_title);
		svo.setB_subject(b_subject);
		svo.setB_wdate(b_wdate);

		int listCnt = boardDao.getBoardListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);

		List<BoardVO> list = boardDao.boardSelectList();

		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getB_wdate();
			date = date.substring(0, 10);
			list.get(i).setB_wdate(date);
			System.out.println(list.get(i).getC_name());
		}
		model.addAttribute("board", list);
		return "user/board/userBoardList";
	}
	
	
	// 자유게시판 글 상세 보기
	@RequestMapping("/userBoardRead.do")
	public String userBoardRead(BoardVO vo, Model model, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("b_no"));
		vo.setB_no(no);
		vo = boardDao.boardSelect(vo);
		
		// 날짜 뒤에 시간 자르고 년-월-일 표시
		String date = vo.getB_wdate();
		date = date.substring(0,10);
		vo.setB_wdate(date);
		
		// 조회수 
		boardDao.updateCount(no);
		
		// 댓글 목록
		
		
		model.addAttribute("boardRead", vo);
		return "user/board/userBoardRead";
	}
			
	
	// 자유게시판 글 작성
	@RequestMapping("/userBoardForm.do")
	public String userBoardForm() {
		return "user/board/userBoardForm";
	}
		
		
	// 자유게시판 글 등록
	@RequestMapping("/userBoardResister.do")
	public String userBoardResister(BoardVO vo, HttpSession session) {
		vo.setB_email((String)session.getAttribute("email")); // 로그인 정보. 작성자가 누군지 알기 위해 담는 거
		boardDao.userBoardInsert(vo);
		return"redirect:userBoardList.do";
	}
	
	
	// 자유게시판 글 수정
	@RequestMapping("/userBoardUpdateForm.do")
	public String userBoardUpdateForm(BoardVO vo, Model model) {
		model.addAttribute("boardSelect", boardDao.boardSelect(vo));
		return "user/board/userBoardUpdateForm";
	}
	
	
	// 자유게시판 글 수정 등록
	@RequestMapping("/userBoardUpdate.do")
	public String userBoardUpdate(BoardVO vo) {
		boardDao.userBoardUpdate(vo);
		return "redirect:userBoardList.do";
	}
	
	
	// 자유게시판 삭제
	@ResponseBody
	@RequestMapping("/userBoardDelete.do")
	public String userBoardDelete(Model model, BoardVO vo, HttpServletRequest request) {
		int b_no = Integer.parseInt(request.getParameter("b_no"));
		vo.setB_no(b_no);
		boardDao.boardDelete(vo);
		return "redirect:userBoardList.do";
	}
	
	
	// 자유게시판 검색
	@ResponseBody
	@RequestMapping("/userBoardSearch.do")
	public List<BoardVO> userBoardSearch(BoardVO vo, Model model) {
		List<BoardVO> list = boardDao.boardSearch(vo);
		
		// 날짜 뒤에 시간 자르고 년-월-일 표시
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getB_wdate();
			date = date.substring(0,10);
			list.get(i).setB_wdate(date);
		}
		return list;
	}
	
	
	// 자유게시판 글 댓글 작성
	
	// 자유게시판 글 댓글 수정
	
	// 자유게시판 글 댓글 삭제 

		
		
	/* ===== 관리자 화면 ===== */

	// 관리자 자유게시판 메인화면
	@RequestMapping("/adminBoardList.do")
	public String adminBoardList(BoardVO vo, Model model, HttpSession session) {
		//
		vo.setB_subject((String) session.getAttribute("subject"));
		List<BoardVO> list = boardDao.boardSelectList();

		// 날짜 뒤에 시간 자르고 년-월-일 표시
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getB_wdate();
			date = date.substring(0, 10);
			list.get(i).setB_wdate(date);
		}
		model.addAttribute("board", list);
		return "admin/boardmanage/adminBoardList";
	}

	// 자유게시판 상세 보기
	@RequestMapping("/adminBoardRead.do")
	public String adminBoardRead(BoardVO vo, Model model, HttpServletRequest request) {
		int no = Integer.parseInt( request.getParameter("b_no"));
		vo.setB_no(no);
		vo = boardDao.boardSelect(vo);

		// 날짜 뒤에 시간 자르고 년-월-일 표시
		String date = vo.getB_wdate();
		date = date.substring(0, 10);
		vo.setB_wdate(date);

		// 조회수
		boardDao.updateCount(no);

		model.addAttribute("boardRead", vo);
		return "admin/boardmanage/adminBoardRead";
	}

	// 자유게시판 삭제
	@ResponseBody
	@RequestMapping("/boardDelete.do")
	public String boardDelete(Model model, BoardVO vo, HttpServletRequest request) {
		int no = Integer.parseInt( request.getParameter("b_no"));
		vo.setB_no(no);
		boardDao.boardDelete(vo);
		return "redirect:adminBoardList.do";
	}

//	// 자유게시판 검색 -- "다시 해야됨"
//	@ResponseBody
//	@RequestMapping("/boardSearch.do")
//	public List<BoardVO> boardSearch(BoardVO vo, Model model) {
//		List<BoardVO> list = boardDao.boardSearch(vo);
//
//		// 날짜 뒤에 시간 자르고 년-월-일 표시
//		for (int i = 0; i < list.size(); i++) {
//			String date = list.get(i).getB_wdate();
//			date = date.substring(0, 10);
//			list.get(i).setB_wdate(date);
//		}
//		return list;
//	}

	// FAQ 목록
	@RequestMapping("/adminFaqList.do")
	public String adminFaqList(FaqVO vo, Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String c_name,
			@RequestParam(required = false) String f_title,
			@ModelAttribute("search") Search svo)
			throws Exception {

		model.addAttribute("search", svo);
		svo.setC_name(c_name);
		svo.setF_title(f_title);
	
		int listCnt = faqDao.getFaqListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		List<FaqVO> list = faqDao.FaqSearchselect(svo); // 페이징 처리 할 수 있게

		// 날짜 뒤에 시간 자르고 년-월-일만
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getF_wdate();
			date = date.substring(0, 10);
			list.get(i).setF_wdate(date);
		}
		model.addAttribute("faqs", list);
		return "admin/faqmanage/adminFaqList";
	}

	// FAQ 상세 보기
	@RequestMapping("/adminFaqRead.do")
	public String adminFaqRead(FaqVO vo, Model model, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("f_no"));
		vo.setF_no(no);
		vo = faqDao.faqSelect(vo);
		model.addAttribute("faqRead", vo);
		return "admin/faqmanage/adminFaqRead";
	}

	// FAQ 작성
	@RequestMapping("/adminFaqForm.do")
	public String adminFaqForm() {
		return "admin/faqmanage/adminFaqForm";
	}

	// FAQ 등록
	@RequestMapping("/faqResister.do")
	public String faqResister(FaqVO vo, HttpSession session) {
		vo.setF_email((String) session.getAttribute("f_email"));
		faqDao.faqInsert(vo);
		System.out.println(vo.getF_title());
		return "redirect:adminFaqList.do";
	}

	// FAQ 수정
	@RequestMapping("/adminFaqUpdateForm.do")
	public String adminFaqUpdateForm(FaqVO vo, Model model, HttpSession session) {
		model.addAttribute("faqSelect", faqDao.faqSelect(vo));
		return "admin/faqmanage/adminFaqUpdateForm";
	}

	// FAQ 수정 등록
	@RequestMapping("/faqUpdate.do")
	public String faqUpdate(FaqVO vo) {
		faqDao.faqUpdate(vo);
		return "redirect:adminFaqList.do";
	}

	// FAQ 삭제
	@ResponseBody
	@RequestMapping("/faqDelete.do")
	public String faqDelete(Model model, FaqVO vo, HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("f_no"));
		vo.setF_no(no);
		faqDao.faqDelete(vo);
		return "redirect:adminFaqList.do";
	}


}
