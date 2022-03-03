package co.maeumi.prj.boardReply.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.maeumi.prj.boardReply.service.BoardReplyService;
import co.maeumi.prj.boardReply.service.BoardReplyVO;

@Repository("boardReplyDao")
public class BoardReplyServiceImpl implements BoardReplyService {

	@Override
	public List<BoardReplyVO> boardReplyList(int br_no) throws Exception {
		return ;
	}

	@Override
	public int boardReplyInsert(BoardReplyVO vo) {
		return 0;
	}

	@Override
	public int boardReplyDelete(BoardReplyVO vo) {
		return 0;
	}

}
