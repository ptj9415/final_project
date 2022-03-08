package co.maeumi.prj.todaystory.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.service.Pagination;
import co.maeumi.prj.service.Search;
import co.maeumi.prj.todaystory.service.TodaystoryMapper;
import co.maeumi.prj.todaystory.service.TodaystoryService;
import co.maeumi.prj.todaystory.service.TodaystoryVO;

@Repository("todayDao")
public class TodaystoryServiceImpl implements TodaystoryService {
	
	@Autowired
	private TodaystoryMapper map;

	

	@Override
	public TodaystoryVO TodaySelect(TodaystoryVO vo) {
		// TODO Auto-generated method stub
		return map.TodaySelect(vo);
	}



	@Override
	public List<TodaystoryVO> TodayStorySelectList(Pagination page) {
		// TODO Auto-generated method stub
		return map.TodayStorySelectList(page);
	}


	@Override
	public int TodayInsert(TodaystoryVO vo) {
		// TODO Auto-generated method stub
		return map.TodayInsert(vo);
	}



	@Override
	public int TodayUpdate(TodaystoryVO vo) {
		// TODO Auto-generated method stub
		return map.TodayUpdate(vo);
	}



	@Override
	public int TodayDelete(TodaystoryVO vo) {
		// TODO Auto-generated method stub
		return map.TodayDelete(vo);
	}



	@Override
	public TodaystoryVO AdminTodaySelect(TodaystoryVO vo) {
		// TODO Auto-generated method stub
		return map.AdminTodaySelect(vo);
	}



	@Override
	public int CountTodayStory() {
		// TODO Auto-generated method stub
		return map.CountTodayStory();
	}



	@Override
	public int getTodayListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getTodayListCnt(svo);
	}



	@Override
	public List<TodaystoryVO> todaySearchselect(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.todaySearchselect(svo);
	}

}
