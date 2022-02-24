package co.maeumi.prj.today.service;

import java.util.List;

public interface TodayMapper {
	List<TodayVO> TodayStorySelectList();
	TodayVO TodaySelect(TodayVO vo);
	int TodayInsert(TodayVO vo);
	int TodayUpdate(TodayVO vo);
	int TodayDelete(TodayVO vo);
	TodayVO AdminTodaySelect(TodayVO vo);
}
