package co.maeumi.prj.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO vo);
	int boardDelete(BoardVO vo);
	List<BoardVO> boardSearch(BoardVO vo); // 검색
	int updateCount(int b_hit); // 조회수
	int userBoardInsert(BoardVO vo); // user 자유게시판 등록
	int userBoardUpdate(BoardVO vo); // user 자유게시판 수정 등록
}
