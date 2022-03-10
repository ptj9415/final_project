package co.maeumi.prj.boardLike.service;

import java.util.List;

public interface BoardLikeMapper {
	List<BoardLikeVO> boardLikeList();
	BoardLikeVO boardLikeSelect(BoardLikeVO vo);
	int boardLikeInsert(BoardLikeVO vo);
	int boardLikeDelete(BoardLikeVO vo);
	int selectLikeCount(BoardLikeVO vo); // 좋아요 수
}
