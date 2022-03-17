package co.maeumi.prj.mypage.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.boardReply.service.BoardReplyVO;
import co.maeumi.prj.mypage.service.myPageMapper;
import co.maeumi.prj.mypage.service.myPageService;
import co.maeumi.prj.mypage.service.myPageVO;
import co.maeumi.prj.order.service.order_datailVO;

@Primary
@Repository
public class myPageServiceImpl implements myPageService {
	@Autowired
	private myPageMapper map;
	
	@Override
	public List<myPageVO> selectOrder(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.selectOrder(vo);
	}

	@Override
	public List<BoardVO> selectBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.selectBoard(vo);
	}

	@Override
	public List<myPageVO> selectPersonal(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.selectPersonal(vo);
	}

	@Override
	public List<myPageVO> selectGroup(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.selectGroup(vo);
	}

	@Override
	public myPageVO findNo(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.findNo(vo);
	}

	@Override
	public int myPageRefund(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.myPageRefund(vo);
	}

	@Override
	public int myPageGroupRefund(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.myPageGroupRefund(vo);
	}

	@Override
	public int myPagePersonalRefund(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.myPagePersonalRefund(vo);
	}

	@Override
	public BoardVO boardDetail(BoardVO vo) {
		// TODO Auto-generated method stub
		return map.boardDetail(vo);
	}

	@Override
	public List<BoardReplyVO> boardReplyDetail(BoardReplyVO vo) {
		// TODO Auto-generated method stub
		return map.boardReplyDetail(vo);
	}

	@Override
	public myPageVO mypagePersonal(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.mypagePersonal(vo);
	}

	@Override
	public myPageVO mypageGroup(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.mypageGroup(vo);
	}

	@Override
	public myPageVO GroupdetailRefund(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.GroupdetailRefund(vo);
	}

	@Override
	public int mypageOrderDelete(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.mypageOrderDelete(vo);
	}

	@Override
	public myPageVO mypagePersonalOrderRefund(myPageVO vo) {
		// TODO Auto-generated method stub
		return map.mypagePersonalOrderRefund(vo);
	}

}
