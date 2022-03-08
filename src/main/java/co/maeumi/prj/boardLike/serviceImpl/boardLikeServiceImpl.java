package co.maeumi.prj.boardLike.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.boardLike.service.boardLikeMapper;
import co.maeumi.prj.boardLike.service.boardLikeService;
import co.maeumi.prj.boardLike.service.boardLikeVO;

@Repository("boardLikeDao")
public class boardLikeServiceImpl implements boardLikeService {

	@Autowired
	private boardLikeMapper map;
	
	@Override
	public List<boardLikeVO> boardLikeList() {
		return map.boardLikeList();
	}

	@Override
	public boardLikeVO boardLikeSelect(boardLikeVO vo) {
		return map.boardLikeSelect(vo);
	}

	@Override
	public int boardLikeInsert(boardLikeVO vo) {
		return map.boardLikeInsert(vo);
	}

	@Override
	public int boardLikeDelete(boardLikeVO vo) {
		return map.boardLikeDelete(vo);
	}

}
