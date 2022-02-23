package co.maeumi.prj.today.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.today.service.TodayMapper;
import co.maeumi.prj.today.service.TodayService;
import co.maeumi.prj.today.service.TodayVO;

@Repository("todayDao")
public class TodayServiceImpl implements TodayService {
	
	@Autowired
	private TodayMapper map;

	

	@Override
	public TodayVO TodaySelect(TodayVO vo) {
		// TODO Auto-generated method stub
		return map.TodaySelect(vo);
	}



	@Override
	public List<TodayVO> TodayStorySelectList() {
		// TODO Auto-generated method stub
		return map.TodayStorySelectList();
	}

}
