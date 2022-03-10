package co.maeumi.prj.board.serviceImpl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.board.service.BoardMapper;
import co.maeumi.prj.board.service.BoardService;
import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.member.service.MemberVO;
import co.maeumi.prj.service.Search;

@Repository("boardDao")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardMapper map;
	
	@Override
	public List<BoardVO> boardSelectList() {
		return map.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return map.boardDelete(vo);
	}

	@Override
	public List<BoardVO> boardSearch(BoardVO vo) {
		return map.boardSearch(vo);
	}

	@Override
	public int updateCount(int b_hit) {
		return map.updateCount(b_hit);
	}

	@Override
	public int userBoardInsert(BoardVO vo) {
		return map.userBoardInsert(vo);
	}

	@Override
	public int userBoardUpdate(BoardVO vo) {
		return map.userBoardUpdate(vo);
	}

	@Override
	public List<BoardVO> boardSearchSelect(Search svo) throws Exception {
		return map.boardSearchSelect(svo);
	}

	@Override
	public int getBoardListCnt(Search svo) throws Exception {
		return map.getBoardListCnt(svo);
	}

	@Override
	public List<BoardVO> userBoardSearchSelect(Search svo) throws Exception {
		return map.userBoardSearchSelect(svo);
	}

	@Override
	public int getUserBoardListCnt(Search svo) throws Exception {
		return map.getUserBoardListCnt(svo);
	}

}