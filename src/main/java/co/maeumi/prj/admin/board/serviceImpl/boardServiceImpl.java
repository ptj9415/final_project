package co.maeumi.prj.admin.board.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.admin.board.service.boardMapper;
import co.maeumi.prj.admin.board.service.boardService;
import co.maeumi.prj.admin.board.service.boardVO;

@Repository("boardDao")
public class boardServiceImpl implements boardService {

	@Autowired
	private boardMapper map;
	
	@Override
	public List<boardVO> boardSelectList() {
		return map.boardSelectList();
	}

	@Override
	public boardVO boardSelect(boardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardDelete(boardVO vo) {
		return map.boardDelete(vo);
	}

	@Override
	public List<boardVO> boardSearch(boardVO vo) {
		return map.boardSearch(vo);
	}

	@Override
	public int updateCount(String b_cnt) {
		return map.updateCount(b_cnt);
	}

}
