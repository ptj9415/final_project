package co.maeumi.prj.todaystory.service;

import java.util.List;

import co.maeumi.prj.service.Pagination;

public interface TodaystoryMapper {
	List<TodaystoryVO> TodayStorySelectList(Pagination page); //페이지네이션 된 리스트 조회하기
	TodaystoryVO TodaySelect(TodaystoryVO vo);
	int TodayInsert(TodaystoryVO vo);
	int TodayUpdate(TodaystoryVO vo);
	int TodayDelete(TodaystoryVO vo);
	TodaystoryVO AdminTodaySelect(TodaystoryVO vo);
	int CountTodayStory(); //전체 수 조회
}
