package co.maeumi.prj.today.service;

import java.util.List;

public interface TodayMapper {
	List<TodayVO> TodayStorySelectList();
	
	TodayVO TodaySelect(TodayVO vo);
}
