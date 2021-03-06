package co.maeumi.prj.boardReply.service;

import java.util.List;

public interface BoardReplyService {
	List<BoardReplyVO> boardReplyList(BoardReplyVO vo) throws Exception;
	int boardReplyInsert(BoardReplyVO vo);
	int boardReplyDelete(BoardReplyVO vo);
	int selectReplyCount(BoardReplyVO vo); // λκΈ μ 
	int mypageBoardDelete(BoardReplyVO vo);
}
