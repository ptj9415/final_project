package co.maeumi.prj.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.admin.board.service.boardService;
import co.maeumi.prj.admin.board.service.boardVO;

@Controller
public class boardController {
	@Autowired
	private boardService boardDao;
	
	// 은솔 관리자 자유게시판
	
	// 자유게시판 목록
	@RequestMapping("/boardList.do")
	public String boardList(boardVO vo, Model model, HttpSession session) {
		//
		vo.setB_subject((String)session.getAttribute("subject"));
		List<boardVO> list = boardDao.boardSelectList();
		
		// 날짜 뒤에 시간 자르고 년-월-일 표시
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getB_wdate();
			date = date.substring(0,10);
			list.get(i).setB_wdate(date);
		}
			model.addAttribute("board", list);
			return "admin/board/boardList";
	}
	
	
	// 자유게시판 상세 보기
	@RequestMapping("/boardRead.do")
	public String boardRead(boardVO vo, Model model, HttpServletRequest request) {
		String no = request.getParameter("b_no");
		vo.setB_no(no);
		vo = boardDao.boardSelect(vo);
		
		// 날짜 뒤에 시간 자르고 년-월-일 표시
		String date = vo.getB_wdate();
		date = date.substring(0,10);
		vo.setB_wdate(date);
		
		// 조회수 
		boardDao.updateCount(no);
		
		model.addAttribute("boardRead", vo);
		return "admin/board/boardRead";
	}
	
	
	// 자유게시판 삭제
	@ResponseBody
	@RequestMapping("/boardDelete.do")
	public String boardDelete(Model model, boardVO vo, HttpServletRequest request) {
		String b_no = request.getParameter("b_no");
		vo.setB_no(b_no);
		boardDao.boardDelete(vo);
		return "redirect:boardList.do";
	}
	
	
	// 자유게시판 검색
	@ResponseBody
	@RequestMapping("/boardSearch.do")
	public List<boardVO> boardSearch(boardVO vo, Model model) {
		List<boardVO> list = boardDao.boardSearch(vo);
		
		// 날짜 뒤에 시간 자르고 년-월-일 표시
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getB_wdate();
			date = date.substring(0,10);
			list.get(i).setB_wdate(date);
		}
		return list;
	}
}
