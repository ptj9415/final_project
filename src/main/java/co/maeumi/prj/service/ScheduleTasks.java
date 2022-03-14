
package co.maeumi.prj.service;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import co.maeumi.prj.todayreply.service.TodayreplyService;
import co.maeumi.prj.todayreply.service.TodayreplyVO;
import co.maeumi.prj.todaystory.service.TodaystoryService;
import co.maeumi.prj.todaystory.service.TodaystoryVO;

@Component
public class ScheduleTasks{

	@Autowired
	private TodaystoryService todayDao;

	@Autowired
	private TodayreplyService todayReplyDao;
	
	/*
	 * @Scheduled(fixedDelay=5000)
	 * 
	 * @RequestMapping("/todayStory.do") public String todayStory(Model model,
	 * TodayVO vo) throws Exception {
	 * ct(vo);
	 * model.addAttribute("todaySelect
	 * vo = todayDao.TodaySelect(vo); todayDao.TodaySelect", vo); System.out.println(vo);
	 * List<TodayReplyVO> todayReplyList
	 * =todayReplyDao.readTodayReply(vo.getSc_no());
	 * model.addAttribute("todayReplyList", todayReplyList);
	 * 
	 * 
	 * return "user/todayStory"; }
	 */
//	public void test() {
//		System.out.println("cron 테스트 : 5초에 1번씩 console 찍기"); 
//		} 
//	@Scheduled(cron="0/5 * * * * *") public void test2() { 
//		System.out.println("@Scheduled annotation : 10초에 1번씩 console 찍기"); 
//		}
//
//	
}

