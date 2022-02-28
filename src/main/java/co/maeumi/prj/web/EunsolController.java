package co.maeumi.prj.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.board.service.BoardService;
import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.faq.service.FaqService;
import co.maeumi.prj.faq.service.FaqVO;

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
	@RequestMapping("/userBoard.do")
	public String userBoard(BoardVO vo, Model model, HttpSession session) {
//		vo.setB_subject((String) session.getAttribute("subject"));
		List<BoardVO> list = boardDao.boardSelectList();

		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getB_wdate();
			date = date.substring(0, 10);
			list.get(i).setB_wdate(date);
		}
		model.addAttribute("board", list);
		return "user/board/userBoard";
	}
	
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
		String no = request.getParameter("b_no");
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
		String b_no = request.getParameter("b_no");
		vo.setB_no(b_no);
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
	public String adminFaqList(FaqVO vo, Model model) {
		List<FaqVO> list = faqDao.faqSelectList();

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
		String no = request.getParameter("f_no");
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
//			vo.setF_email((String) session.getAttribute("f_email"));
		vo.setF_email("luna@naver.com");
		faqDao.faqInsert(vo);
		System.out.println(vo.getF_title());
		return "redirect:adminFaqList.do";
	}

	// FAQ 수정
	@RequestMapping("/adminFaqUpdateForm.do")
	public String faqUpdateForm(FaqVO vo, Model model, HttpSession session) {
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
		String f_no = request.getParameter("f_no");
		vo.setF_no(f_no);
		faqDao.faqDelete(vo);
		return "redirect:adminFaqList.do";
	}

//	// FAQ 검색 -- 다시해야됨
//	@ResponseBody
//	@RequestMapping("/faqSearch.do")
//	public List<FaqVO> faqSearch(FaqVO vo, Model model) {
//		List<FaqVO> list = faqDao.faqSearch(vo);
//		for (int i = 0; i < list.size(); i++) {
//			String date = list.get(i).getF_wdate();
//			date = date.substring(0, 10);
//			list.get(i).setF_wdate(date);
//		}
//		return list;
//	}

}
