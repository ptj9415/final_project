package co.maeumi.prj.today.service;



import org.springframework.stereotype.Service;

@Service
public interface TodayService {
	 TodayVO TodaySelect(TodayVO vo);
}
