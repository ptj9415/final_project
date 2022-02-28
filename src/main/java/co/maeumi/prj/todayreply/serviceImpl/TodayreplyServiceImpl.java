package co.maeumi.prj.todayreply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.todayreply.service.TodayreplyMapper;
import co.maeumi.prj.todayreply.service.TodayreplyService;
import co.maeumi.prj.todayreply.service.TodayreplyVO;

@Repository("todayReplyDao")
public class TodayreplyServiceImpl implements TodayreplyService {
	
	@Autowired
	private TodayreplyMapper map;
	
	@Override
	public List<TodayreplyVO> readTodayReply(String sr_no) {
		// TODO Auto-generated method stub
		return map.readTodayReply(sr_no);
	}

	@Override
	public int todayReplyInsert(TodayreplyVO vo) {
		// TODO Auto-generated method stub
		return map.todayReplyInsert(vo);
	}

	@Override
	public int todayReplyDelete(TodayreplyVO vo) {
		// TODO Auto-generated method stub
		return map.todayReplyDelete(vo);
	}

}
