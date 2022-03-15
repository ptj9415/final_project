package co.maeumi.prj.mypage.service;

import java.util.List;

import co.maeumi.prj.board.service.BoardVO;

public interface myPageService {
	List<myPageVO> selectOrder(myPageVO vo);
	List<BoardVO> selectBoard(BoardVO vo);
	List<myPageVO> selectPersonal(myPageVO vo);
	List<myPageVO> selectGroup(myPageVO vo);
}
