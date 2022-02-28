package co.maeumi.prj.board.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.board.service.BoardMapper;
import co.maeumi.prj.board.service.BoardService;
import co.maeumi.prj.board.service.BoardVO;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper map;

	@Override
	public List<BoardVO> boardSelectList() {
		// TODO Auto-generated method stub
		return map.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardSelect(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardDelete(vo);
	}

	@Override
	public List<BoardVO> boardSearch(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardSearch(vo);
	}

	@Override
	public int updateCount(String b_cnt) {
		// TODO Auto-generated method stub
		return map.updateCount(b_cnt);
	}

}
