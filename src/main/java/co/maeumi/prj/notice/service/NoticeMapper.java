package co.maeumi.prj.notice.service;

import java.util.List;

public interface NoticeMapper {
	List<NoticeVO> noticeSelectList();
	NoticeVO noticeSelect(NoticeVO vo);
	int noticeInsert(NoticeVO vo);
	int noticeUpdate(NoticeVO vo);
	int noticeDelete(NoticeVO vo);
	
//	// 게시판 목록(페이징 적용)
//	public List<NoticeVO> getListPaging(Criteria cri);
//		// pageNum, amount의 정보를 DB에 전달하기 위해서 Criteria클래스를 파라미터로 부여
//	
//	// 게시판 총 갯수 
//	public int getTotal(Criteria cri); 
	
}
