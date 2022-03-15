package co.maeumi.prj.mypage.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.mypage.service.myPageMapper;
import co.maeumi.prj.mypage.service.myPageService;
import co.maeumi.prj.mypage.service.myPageVO;

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

}
