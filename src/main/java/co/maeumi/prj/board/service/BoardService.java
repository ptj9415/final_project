package co.maeumi.prj.board.service;

import java.util.List;

public interface BoardService {
	List<BoardVO> boardSelectList();
	BoardVO boardSelect(BoardVO vo);
	int boardDelete(BoardVO vo);
	List<BoardVO> boardSearch(BoardVO vo); // 검색
	int updateCount(String b_cnt); // 조회수

}
