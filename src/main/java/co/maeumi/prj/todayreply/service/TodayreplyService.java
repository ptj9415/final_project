package co.maeumi.prj.todayreply.service;

import java.util.List;

public interface TodayreplyService {
	List<TodayreplyVO> readTodayReply(String sr_no);
	int todayReplyInsert(TodayreplyVO vo);
	int todayReplyDelete(TodayreplyVO vo);
	
}
