package co.maeumi.prj.board.service;

import java.util.List;

import co.maeumi.prj.member.service.MemberVO;
import co.maeumi.prj.service.Search;

public interface BoardMapper {
	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO vo);
	int boardDelete(BoardVO vo);
	List<BoardVO> boardSearch(BoardVO vo); // 검색
	int updateCount(int b_hit); // 조회수
	int userBoardInsert(BoardVO vo); // user 자유게시판 등록
	int userBoardUpdate(BoardVO vo); // user 자유게시판 수정 등록
	
	// 검색 & 페이징 처리
	public List<BoardVO> boardSearchSelect(Search svo) throws Exception;
	int getBoardListCnt(Search svo) throws Exception;
	
	public List<BoardVO> userBoardSearchSelect(Search svo) throws Exception;
	int getUserBoardListCnt(Search svo) throws Exception;
}