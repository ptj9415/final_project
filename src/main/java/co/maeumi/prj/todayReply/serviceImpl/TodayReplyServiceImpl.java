package co.maeumi.prj.todayReply.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.todayReply.service.TodayReplyMapper;
import co.maeumi.prj.todayReply.service.TodayReplyService;
import co.maeumi.prj.todayReply.service.TodayReplyVO;

@Repository("todayReplyDao")
public class TodayReplyServiceImpl implements TodayReplyService {
	
	@Autowired
	private TodayReplyMapper map;
	
	@Override
	public List<TodayReplyVO> readTodayReply(String sr_no) {
		// TODO Auto-generated method stub
		return map.readTodayReply(sr_no);
	}

	@Override
	public int todayReplyInsert(TodayReplyVO vo) {
		// TODO Auto-generated method stub
		return map.todayReplyInsert(vo);
	}

	@Override
	public int todayReplyDelete(TodayReplyVO vo) {
		// TODO Auto-generated method stub
		return map.todayReplyDelete(vo);
	}

}
