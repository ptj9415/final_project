package co.maeumi.prj.todayReply.service;

import java.util.List;

public interface TodayReplyMapper {
	List<TodayReplyVO> readTodayReply(String sr_no);
	int todayReplyInsert(TodayReplyVO vo);
	int todayReplyDelete(TodayReplyVO vo);
}
