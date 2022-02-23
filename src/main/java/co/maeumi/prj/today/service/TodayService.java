package co.maeumi.prj.today.service;



import java.util.List;


import org.springframework.stereotype.Service;

@Service
public interface TodayService {

	List<TodayVO> TodayStorySelectList();
	
	TodayVO TodaySelect(TodayVO vo);
}
