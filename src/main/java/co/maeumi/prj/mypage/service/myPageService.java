package co.maeumi.prj.mypage.service;

import java.util.List;

import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.boardReply.service.BoardReplyVO;

public interface myPageService {
	List<myPageVO> selectOrder(myPageVO vo);
	List<BoardVO> selectBoard(BoardVO vo);
	List<myPageVO> selectPersonal(myPageVO vo);
	List<myPageVO> selectGroup(myPageVO vo);
	
	myPageVO findNo(myPageVO vo);  //개인 상담인지 그룹상담인지 번호 찾기.
	int myPageRefund(myPageVO vo);		//결제 내역 환불 완료로 바꾸기
	int myPageGroupRefund(myPageVO vo);  //그룹 상담 예약 환불로 바꾸기.
	int myPagePersonalRefund(myPageVO vo); //개인 상담 예약 환불로 바꾸기
	
	BoardVO boardDetail(BoardVO vo);
	
	List<BoardReplyVO> boardReplyDetail(BoardReplyVO vo);
	myPageVO mypagePersonal(myPageVO vo);
	myPageVO mypageGroup(myPageVO vo);
	
	myPageVO GroupdetailRefund(myPageVO vo); //그룹상담 환불
}
