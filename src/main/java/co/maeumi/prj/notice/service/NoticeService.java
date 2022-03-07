package co.maeumi.prj.notice.service;

import java.util.List;

import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.service.Search;

public interface NoticeService {
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	
	int statusUpdate(NoticeVO vo);   // 공지사항 상단 고정 처리
	
	
	int getNoticeListCnt(Search svo) throws Exception;
	public List<NoticeVO> noticeSearchselect(Search svo) throws Exception;
	int hitUpdate(NoticeVO vo);  // 조회수 올리기
	
}
