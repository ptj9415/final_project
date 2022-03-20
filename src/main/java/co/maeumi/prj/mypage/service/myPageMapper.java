package co.maeumi.prj.mypage.service;

import java.util.List;

import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.boardReply.service.BoardReplyVO;
import co.maeumi.prj.order.service.order_datailVO;

public interface myPageMapper {
	List<myPageVO> selectOrder(myPageVO vo);
	List<BoardVO> selectBoard(BoardVO vo);
	List<myPageVO> selectPersonal(myPageVO vo);
	List<myPageVO> selectGroup(myPageVO vo);
	
	myPageVO findNo(myPageVO vo);
	int myPageRefund(myPageVO vo);
	int myPageGroupRefund(myPageVO vo);  //그룹 상담 예약 환불로 바꾸기.
	int myPagePersonalRefund(myPageVO vo); //개인 상담 예약 환불로 바꾸기
	
	BoardVO boardDetail(BoardVO vo); //보드 디테일
	
	List<BoardReplyVO> boardReplyDetail(BoardReplyVO vo);
	myPageVO mypagePersonal(myPageVO vo);
	myPageVO mypageGroup(myPageVO vo);
	
	myPageVO GroupdetailRefund(myPageVO vo); //그룹상담 환불
	
	int mypageOrderDelete(myPageVO vo);
	
	myPageVO mypagePersonalOrderRefund(myPageVO vo);
}
