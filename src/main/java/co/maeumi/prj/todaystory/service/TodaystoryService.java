package co.maeumi.prj.todaystory.service;



import java.util.List;


import org.springframework.stereotype.Service;

@Service
public interface TodaystoryService {

	List<TodaystoryVO> TodayStorySelectList();
	TodaystoryVO TodaySelect(TodaystoryVO vo);
	int TodayInsert(TodaystoryVO vo);
	int TodayUpdate(TodaystoryVO vo);
	int TodayDelete(TodaystoryVO vo);
	TodaystoryVO AdminTodaySelect(TodaystoryVO vo);
}
