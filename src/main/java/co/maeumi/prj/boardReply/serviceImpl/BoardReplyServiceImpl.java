package co.maeumi.prj.boardReply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.boardReply.service.BoardReplyMapper;
import co.maeumi.prj.boardReply.service.BoardReplyService;
import co.maeumi.prj.boardReply.service.BoardReplyVO;

@Repository("boardReplyDao")
public class BoardReplyServiceImpl implements BoardReplyService {

	@Autowired
	private BoardReplyMapper map;
	
	@Override

	public List<BoardReplyVO> boardReplyList(BoardReplyVO vo) throws Exception {
		return map.boardReplyList(vo);

	}

	@Override
	public int boardReplyInsert(BoardReplyVO vo) {
		return map.boardReplyInsert(vo);
	}

	@Override
	public int boardReplyDelete(BoardReplyVO vo) {
		return map.boardReplyDelete(vo);
	}

	@Override
	public int selectReplyCount(BoardReplyVO vo) {
		return map.selectReplyCount(vo);
	}


}
