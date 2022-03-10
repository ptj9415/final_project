package co.maeumi.prj.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.board.service.BoardService;
import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.boardLike.service.BoardLikeService;
import co.maeumi.prj.boardLike.service.BoardLikeVO;
import co.maeumi.prj.boardReply.service.BoardReplyService;
import co.maeumi.prj.boardReply.service.BoardReplyVO;
import co.maeumi.prj.faq.service.FaqService;
import co.maeumi.prj.faq.service.FaqVO;
import co.maeumi.prj.service.Search;

//@RestController는... 전부다.. ajax처리할 때.... 아님 발자국처럼 보임;
@Controller
public class EunsolController {

	// F&Q
	@Autowired
	private FaqService faqDao;

	// 자유게시판
	@Autowired
	private BoardService boardDao;

	// 자유게시판 댓글
	@Autowired
	private BoardReplyService boardReplyDao;

	// 자유게시판 좋아요
	@Autowired
	private BoardLikeService boardLikeDao;

	/* ===== 사용자 화면 ===== */

	// 사용자 FAQ 메인화면
	@PostMapping("/userFaq.do") /* == @RequestMapping의 줄임말 : Post로 RequestMapping 해줌 */
	public String userFaq(FaqVO vo, Model model) {
		model.addAttribute("faqs", faqDao.faqSelectList());
		
		return "user/faq/userFaq";
	}

	// 사용자 자유게시판 메인화면
	@RequestMapping("/userBoardList.do")
	public String userBoardList(BoardVO vo, Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String b_title,
			@ModelAttribute("search") Search svo)
			throws Exception {
				
			model.addAttribute("search", svo);
			svo.setB_title(b_title);

		int listCnt = boardDao.getUserBoardListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		model.addAttribute("board", boardDao.userBoardSearchSelect(svo));
		
		return "user/board/userBoardList";
	}

	// 자유게시판 글 상세 보기
	@RequestMapping("/userBoardRead.do")
	public String userBoardRead(BoardVO vo, Model model, @Param("b_no") int b_no, HttpServletRequest request,
			BoardReplyVO rvo, BoardLikeVO lvo, HttpSession session) throws Exception {
		vo = boardDao.boardSelect(vo);

		// 날짜 뒤에 시간 자르고 년-월-일 표시
		String date = vo.getB_wdate();
		date = date.substring(0, 10);
		vo.setB_wdate(date);

		model.addAttribute("boardRead", vo);

		// 조회수
		boardDao.updateCount(vo.getB_no());

		// 댓글 목록
		model.addAttribute("boardReplyList", boardReplyDao.boardReplyList(rvo));

		// 댓글 개수
		model.addAttribute("br_count", boardReplyDao.selectReplyCount(rvo));

		// 좋아요
		lvo.setM_email((String)session.getAttribute("email"));
		model.addAttribute("boardLike", boardLikeDao.boardLikeSelect(lvo));
		
		// 좋아요 개수
		model.addAttribute("like_count", boardLikeDao.selectLikeCount(lvo));

		return "user/board/userBoardRead";
	}

	// 자유게시판 글 댓글 등록
	@ResponseBody
	@RequestMapping("/boardReplyResister.do")
	public String boardReplyResister(BoardReplyVO vo, HttpSession session) {
		vo.setBr_name((String) session.getAttribute("nickname")); // 로그인 한 사람의 nickname과 email이 세션에 담겨있고
		vo.setBr_email((String) session.getAttribute("email")); // 세션에 담긴 nickname, email을 댓글 테이블의 "글쓴이"에 담는것

		boardReplyDao.boardReplyInsert(vo);

		return "OK";
	}

	// 자유게시판 글 댓글 삭제
	@ResponseBody
	@RequestMapping("/boardReplyDelete.do")
	public String boardReplyDelete(BoardReplyVO vo, HttpServletRequest request) {
		boardReplyDao.boardReplyDelete(vo);
		
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
		vo.setB_email((String) session.getAttribute("email")); // 로그인 정보. 작성자가 누군지 알기 위해 담는 거
		boardDao.userBoardInsert(vo);
		
		return "redirect:userBoardList.do";
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
		boardDao.boardDelete(vo);
		
		return "redirect:userBoardList.do";
	}

	// 자유게시판 좋아요 등록
	@ResponseBody
	@RequestMapping("/boardLikeInsert.do")
	public int boardLikeInsert(BoardLikeVO vo, HttpSession session, HttpServletRequest request) {
		boardLikeDao.boardLikeInsert(vo);
		int like = boardLikeDao.selectLikeCount(vo);
		
		return like;  // ajax data 값
	}

	// 자유게시판 좋아요 삭제
	@ResponseBody
	@RequestMapping("/boardLikeDelete.do")
	public int boardLikeDelete(BoardLikeVO vo, HttpSession session) {
		boardLikeDao.boardLikeDelete(vo);
		int disLike = boardLikeDao.selectLikeCount(vo);		
		
		return disLike;
	}
	
	// MBIT 
	@RequestMapping("/mbti.do")
	public String mbti() {
		return  "user/test/mbti";
	}

	/* ===== 관리자 화면 ===== */

	// 관리자 자유게시판 메인화면
	@RequestMapping("/adminBoardList.do")
	public String adminBoardList(BoardVO vo, Model model,
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String m_nickname,
			@RequestParam(required = false, defaultValue = "") String b_title,
			@RequestParam(required = false, defaultValue = "all") String b_subject,
			@RequestParam(required = false, defaultValue = "") String b_wdate, 
			@ModelAttribute("search") Search svo)
			throws Exception {

		model.addAttribute("search", svo);
		svo.setM_nickname(m_nickname);
		svo.setB_title(b_title);
		svo.setB_subject(b_subject);
		svo.setB_wdate(b_wdate);

		int listCnt = boardDao.getBoardListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		List<BoardVO> list = boardDao.boardSearchSelect(svo); // 페이징 처리 할 수 있게

		// 날짜 뒤에 시간 자르고 년-월-일만
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
		vo = boardDao.boardSelect(vo);

		// 날짜 뒤에 시간 자르고 년-월-일 표시
		String date = vo.getB_wdate();
		date = date.substring(0, 10);
		vo.setB_wdate(date);

		// 조회수
		boardDao.updateCount(vo.getB_no());

		model.addAttribute("boardRead", vo);		
		return "admin/boardmanage/adminBoardRead";
	}

	// 자유게시판 삭제
	@ResponseBody
	@RequestMapping("/boardDelete.do")
	public String boardDelete(Model model, BoardVO vo, HttpServletRequest request) {
		boardDao.boardDelete(vo);
		
		return "OK";
	}

	// 관리자 FAQ 메인화면
	@RequestMapping("/adminFaqList.do")
	public String adminFaqList(FaqVO vo, Model model, 
			@RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range, 
			@ModelAttribute("search") Search svo)
			throws Exception {

		model.addAttribute("search", svo);

		int listCnt = faqDao.getFaqListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		List<FaqVO> list = faqDao.FaqSearchSelect(svo); // 페이징 처리 할 수 있게

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
	@RequestMapping("/adminFaqResister.do")
	public String faqResister(FaqVO vo, HttpSession session) {
		vo.setF_email((String) session.getAttribute("email")); // 로그인 정보. 로그인 할 때 담는걸로 가져와야 함 !!
		faqDao.faqInsert(vo);
		
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
		faqDao.faqDelete(vo);
		
		return "redirect:adminFaqList.do";
	}

}
