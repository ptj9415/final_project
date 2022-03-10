package co.maeumi.prj.boardLike.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.boardLike.service.BoardLikeMapper;
import co.maeumi.prj.boardLike.service.BoardLikeService;
import co.maeumi.prj.boardLike.service.BoardLikeVO;

@Repository("boardLikeDao")
public class BoardLikeServiceImpl implements BoardLikeService {

	@Autowired
	private BoardLikeMapper map;
	
	@Override
	public List<BoardLikeVO> boardLikeList() {
		return map.boardLikeList();
	}

	@Override
	public BoardLikeVO boardLikeSelect(BoardLikeVO vo) {
		return map.boardLikeSelect(vo);
	}

	@Override
	public int boardLikeInsert(BoardLikeVO vo) {
		return map.boardLikeInsert(vo);
	}

	@Override
	public int boardLikeDelete(BoardLikeVO vo) {
		return map.boardLikeDelete(vo);
	}

	@Override
	public int selectLikeCount(BoardLikeVO vo) {
		return map.selectLikeCount(vo);
	}

}
