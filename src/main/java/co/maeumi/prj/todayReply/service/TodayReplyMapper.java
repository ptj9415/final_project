package co.maeumi.prj.todayReply.service;

import java.util.List;

public interface TodayReplyMapper {
	List<TodayReplyVO> readTodayReply(String sr_no);
	String todayReplyInsert(TodayReplyVO vo);
	String todayReplyDelete(TodayReplyVO vo);
}
