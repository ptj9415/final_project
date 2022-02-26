package co.maeumi.prj.admin.board.service;

import java.util.List;

public interface boardMapper {
	List<boardVO> boardSelectList();
	boardVO boardSelect(boardVO vo);
	int boardDelete(boardVO vo);
	List<boardVO> boardSearch(boardVO vo); // 검색
	int updateCount(String b_cnt); // 조회수
}
