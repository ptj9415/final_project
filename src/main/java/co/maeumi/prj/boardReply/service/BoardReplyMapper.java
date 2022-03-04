package co.maeumi.prj.boardReply.service;

import java.util.List;

public interface BoardReplyMapper {
	List<BoardReplyVO> boardReplyList(BoardReplyVO vo) throws Exception;
	int boardReplyInsert(BoardReplyVO vo);
	int boardReplyDelete(BoardReplyVO vo);
}