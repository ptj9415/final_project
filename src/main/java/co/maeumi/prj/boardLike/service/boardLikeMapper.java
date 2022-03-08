package co.maeumi.prj.boardLike.service;

import java.util.List;

public interface boardLikeMapper {
	List<boardLikeVO> boardLikeList();
	boardLikeVO boardLikeSelect(boardLikeVO vo);
	int boardLikeInsert(boardLikeVO vo);
	int boardLikeDelete(boardLikeVO vo);
}
