package co.maeumi.prj.notice.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.notice.service.NoticeMapper;
import co.maeumi.prj.notice.service.NoticeService;
import co.maeumi.prj.notice.service.NoticeVO;
import co.maeumi.prj.service.Search;

@Repository("noticeDao")
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeMapper map;
	
	@Override
	public List<NoticeVO> noticeSelectList() {
		// TODO Auto-generated method stub
		return map.noticeSelectList();
	}

	@Override
	public NoticeVO noticeSelect(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeSelect(vo);
	}

	@Override
	public int noticeInsert(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeInsert(vo);
	}

	@Override
	public int noticeUpdate(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeUpdate(vo);
	}

	@Override
	public int noticeDelete(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.noticeDelete(vo);
	}

	@Override
	public int getNoticeListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getNoticeListCnt(svo);
	}

	@Override
	public List<NoticeVO> noticeSearchselect(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.noticeSearchselect(svo);
	}

	@Override
	public int statusUpdate(NoticeVO vo) {
		// TODO Auto-generated method stub
		return map.statusUpdate(vo);
	}
	

}
