package co.maeumi.prj.boardLike.service;

import java.util.List;

public interface boardLikeService {
	List<boardLikeVO> boardLikeList();
	boardLikeVO boardLikeSelect(boardLikeVO vo);
	int boardLikeInsert(boardLikeVO vo);
	int boardLikeDelete(boardLikeVO vo);
}
