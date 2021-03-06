package co.maeumi.prj.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.coupon.service.CouponService;
import co.maeumi.prj.coupon.service.CouponVO;
import co.maeumi.prj.order.service.orderService;
import co.maeumi.prj.order.service.order_datailVO;
import co.maeumi.prj.personalcounsel.service.PersonalcounselService;
import co.maeumi.prj.personalcounsel.service.PersonalcounselVO;
import co.maeumi.prj.service.Pagination;
import co.maeumi.prj.service.Search;
import co.maeumi.prj.todayreply.service.TodayreplyService;
import co.maeumi.prj.todayreply.service.TodayreplyVO;
import co.maeumi.prj.todaystory.service.TodaystoryService;
import co.maeumi.prj.todaystory.service.TodaystoryVO;

@Controller
public class EjuController {

	@Autowired
	private TodaystoryService todayDao;

	@Autowired
	private TodayreplyService todayReplyDao;

	@Autowired
	private PersonalcounselService personalCounselDao;

	
	@Autowired
	private CounselorService counselorDao;
	
	@Autowired
	private CouponService couponDao;
	
	@Autowired
	private orderService orderDao;
	
	Pagination page; // 전역변수로 선언해준것

	/* =====사용자 화면===== */
	
	//심리검사-자존감검사
	@RequestMapping("/selfEsteem.do")
	public String selfEsteem() {
		
		return "user/test/selfEsteem";
	}

	// 개인상담 메인화면 불러오기
	@RequestMapping("/userPersonalCounsel.do")
	public String userPersonalCounsel(Model model, HttpServletRequest request) {
		return "user/personalcounsel/userPersonalCounsel";
	}

	// 개인상담 신청 step2
	@RequestMapping("/personalCounselStep2.do")
	public String personalCounselStep2(Model model, PersonalcounselVO vo, HttpServletRequest request) {
		String test = request.getParameter("onecheck");
		System.out.println("step2 : " + test);
		vo.setCcg_subname(test);
		PersonalcounselVO gvo = personalCounselDao.CounselorSelect(vo);  //상담 상세내용
		System.out.println(vo.getC_email());
		List<PersonalcounselVO> subNameList = personalCounselDao.SubnameSelectList(vo);//상담사가 갖고있는 카테고리 리스트
		List<PersonalcounselVO> counselorList = personalCounselDao.CounselorSelectList(vo);
		model.addAttribute("subNameList",subNameList);
		model.addAttribute("counselorList", counselorList);
		model.addAttribute("type", test);
		model.addAttribute("counselorSelect", gvo);
		return "user/personalcounsel/personalCounselStep2";
	}
	// 상담사 자세히 보기 
	@RequestMapping("/counselorDetail.do")
	public String counselorDetail(PersonalcounselVO vo, @RequestParam("c_email") String c_email, Model model,
			HttpServletRequest request, HttpSession session){
		String type = request.getParameter("onecheck");
		vo.setCcg_subname(type);
		PersonalcounselVO gvo = personalCounselDao.CounselorSelect(vo);  //상담 상세내용
		List<PersonalcounselVO> subNameList = personalCounselDao.SubnameSelectList(vo);//상담사가 갖고있는 카테고리 리스트
		model.addAttribute("subNameList",subNameList);
		//System.out.println("상담사디테일페이지왜않ㄴㅏ와 "+ c_email);
		//System.out.println(type);
		model.addAttribute("type", type);
		model.addAttribute("email", c_email);
		model.addAttribute("counselorSelect", gvo);
		return "user/personalcounsel/counselorDetail";
	}

	// 개인상담 신청 step3
	@RequestMapping("/personalCounselStep3.do")
	public String personalCounselStep3(PersonalcounselVO vo, @RequestParam("c_email") String c_email, Model model,
			HttpServletRequest request, HttpSession session) {
		String type = request.getParameter("onecheck");
		//System.out.println("step3 : " + type);
		//System.out.println("step3 : " + c_email);
		vo.setCcg_subname(type);
		vo = personalCounselDao.CounselorSelect(vo);

		model.addAttribute("type", type);
		model.addAttribute("email", c_email);

		model.addAttribute("counselorSelect", vo);
		return "user/personalcounsel/personalCounselStep3";
	}

	// 개인상담 신청 step4
	@RequestMapping("/personalCounselStep4.do")
	public String personalCounselStep4(PersonalcounselVO vo, @RequestParam("c_email") String c_email, Model model,
			HttpServletRequest request, HttpSession session) {
		String type2 = request.getParameter("onecheck");
		System.out.println("step4주제 : " + type2);
		System.out.println("이메일 : " + c_email);
		vo.setCcg_subname(type2);
		vo = personalCounselDao.CounselorSelect(vo);

		String type3 = request.getParameter("c-type");
		int num = type3.indexOf("/");
		String pr_type = type3.substring(num+1);
		type3 = type3.substring(0,num);
		
		System.out.println("가격 : " + type3);
		System.out.println("방식 : " + pr_type);
		model.addAttribute("type3", type3); //가격
		model.addAttribute("type2", type2); //주제
		model.addAttribute("c_email", c_email); //회원이메일
		model.addAttribute("pr_type", pr_type); //방식
		return "user/personalcounsel/personalCounselStep4";
	}

	// 개인상담 신청내역 확인 페이지
	@RequestMapping("/personalCounselApplication.do")
	public String personalCounselApplication(PersonalcounselVO vo, @RequestParam("c_email") String c_email, Model model,
			HttpServletRequest request, HttpSession session, CouponVO cpvo) {
		String type2 = request.getParameter("onecheck");
		String type3 = request.getParameter("c-type");
		String time = request.getParameter("time");
		int times = Integer.parseInt(time);
		times = times +1;
		String timess = String.valueOf(times);
		time = time + timess;
		if (time.length() == 3) {
			time = "0"+time;
		}
		String pr_type = vo.getPr_type();
		String pr_date = vo.getPr_date();
		System.out.println("==========================");
		System.out.println(time);
		System.out.println("application"+ c_email);
		System.out.println("app주제 : " + type2);
		System.out.println("방식,가격 : " + type3);
		
		vo.setCcg_subname(type2);
		vo = personalCounselDao.CounselorSelect(vo);
		
		//쿠폰
		cpvo.setM_email((String)session.getAttribute("email")); // 세션값 대신 넣어주기.
		List<CouponVO> list = couponDao.couponMemberSelectList(cpvo);
		
		model.addAttribute("time", time);
		model.addAttribute("c_email",c_email);
		model.addAttribute("type2",type2);
		model.addAttribute("type3",type3);
		model.addAttribute("counselorSelect", vo);
		model.addAttribute("coupon",list);
		model.addAttribute("pr_type", pr_type);
		model.addAttribute("pr_date", pr_date);
		return "user/personalcounsel/personalCounselApplication";

	}
	
	//결제완료 페이지
	@RequestMapping("/paymentComplete.do")
	public String paymentComplete(PersonalcounselVO vo, Model model,order_datailVO ovo, CouponVO cvo,HttpServletRequest request, HttpSession session) {
		vo.setM_email((String)session.getAttribute("email"));
		int num = personalCounselDao.personalCounselInsert(vo);
		System.out.println(vo.getC_email());
		if (num == 1) {
			int max = personalCounselDao.personalMax();
			System.out.println(max);
			ovo.setPr_no(max);
			ovo.setOr_price(vo.getPr_price());
			ovo.setOr_type(vo.getPr_type());
			ovo.setC_email(vo.getC_email());
			ovo.setM_email((String)session.getAttribute("email"));
			ovo.setM_nickname((String)session.getAttribute("nickname"));
			orderDao.orderPersonalInsert(ovo);
			vo.setPr_no(max);
			PersonalcounselVO result = personalCounselDao.counselorResultSelect(vo);
			model.addAttribute("result",result);
			System.out.println(cvo.getC_no());
			//쿠폰 적용 후 삭제하는 메소드
			String c_no = request.getParameter("c_no");
	         int c_nos = Integer.parseInt(c_no);
	         System.out.println(c_nos);
	         if (c_nos != 0) {
	            couponDao.couponDelete(cvo);        //쿠폰 삭제 메소드
	         }
		}
		
		return "user/personalcounsel/paymentComplete";
	}

	// css sample page
	@RequestMapping("/samplePage.do")
	public String samplePage() {
		return "user/personalcounsel/samplePage";

	}

	// 오늘의 한마디 메인화면
	@RequestMapping("/userTodayStory.do")
	public String userTodayStory(Model model, TodaystoryVO vo, HttpSession session) throws Exception {
		// session.setAttribute("sc_no", sc_no);

		// 오늘의 한마디 주제
		vo = todayDao.TodaySelect(vo);
		todayDao.TodaySelect(vo);
		model.addAttribute("todaySelect", vo);

		// 오늘의 한마디 주제에 따른 댓글
		List<TodayreplyVO> todayReplyList = todayReplyDao.readTodayReply(vo.getSc_no());
		model.addAttribute("todayReplyList", todayReplyList);
		return "user/todaystory/userTodayStory";
	}

	// 오늘의 한마디 댓글 등록
	@RequestMapping("/todayReplyInsert.do")
	public String todayReplyInsert(TodayreplyVO vo, Model model, HttpServletRequest request, HttpSession session) {
		//System.out.println(request.getParameter("sc_no"));
		vo.setSr_writer((String) session.getAttribute("nickname")); 
		
		todayReplyDao.todayReplyInsert(vo);

		//model.addAttribute("todayReplyInsertForm", todayReplyDao.todayReplyInsert(vo));
		return "redirect:userTodayStory.do";
	}

	// 오늘의 한마디 user 댓글 삭제
	@RequestMapping("/todayReplyDelete.do")
	@ResponseBody
	public String todayReplyDelete(TodayreplyVO vo, HttpServletRequest request) {

		String sr_no = request.getParameter("sr_no");
		int num = Integer.parseInt(sr_no);
		vo.setSr_no(num);
		todayReplyDao.todayReplyDelete(vo);

		return "OK";
	}

	/* ===== 상담사 화면 ===== */


	// 개인상담 관리 메인화면
	@RequestMapping("/counselorPersonalList.do")
	public String counselorPersonalList(Model model, HttpServletRequest request, 
				@RequestParam(required = false, defaultValue = "1") int page,
				@RequestParam(required = false, defaultValue = "1") int range,
				@RequestParam(required = false, defaultValue = "all") String pr_type,
				@RequestParam(required = false, defaultValue = "") String pr_date,
				@RequestParam(required = false, defaultValue = "all") String pr_status,
				@RequestParam(required = false, defaultValue = "all") String ccg_subname,
				@RequestParam(required = false, defaultValue = "") String m_nickname, Search svo
			) throws Exception {
		
		model.addAttribute("search",svo);
		svo.setPr_type(pr_type);
		svo.setPr_date(pr_date);
		svo.setPr_status(pr_status);
		svo.setM_nickname(m_nickname);
		svo.setCcg_subname(ccg_subname);
		
		int listCnt = personalCounselDao.getPRListCnt(svo);
		System.out.println(listCnt);
		svo.pageinfo(page, range, listCnt);
		
		model.addAttribute("pagination", svo);
		List<PersonalcounselVO> list = personalCounselDao.prSearchSelect(svo);
		/*
		 * for (int i = 0; i < list.size(); i++) { String date =
		 * list.get(i).getPr_date(); date = date.substring(0, 10);
		 * list.get(i).setPr_date(date); };
		 */
		model.addAttribute("personalCounel", list);
		return "counselor/personalcounselmanage/counselorPersonalList";
	}

	// 개인상담 관리 상세화면
	@RequestMapping("/counselorPersonalDetail.do")
	public String counselorPersonalDetail(Model model, PersonalcounselVO vo, HttpServletRequest request) {
		vo = personalCounselDao.PersonalCounselSelect(vo);
		
		model.addAttribute("counselDetail", vo);
		return "counselor/personalcounselmanage/counselorPersonalDetail";
	}

	
	//개인상담 관리 삭제
	@RequestMapping("/personalCounselDelete.do")
	@ResponseBody
	public String personalCounselDelete(PersonalcounselVO vo, Model model, HttpServletRequest request) {
		
		personalCounselDao.PersonalCounselDelete(vo);
		
		return "ok";
	}

	// 개인상담 관리 update modal form 호출
		@RequestMapping("/personalCounselUpdateForm.do")
		@ResponseBody
		public String personalCounselUpdateModal(PersonalcounselVO vo, Model model, HttpServletRequest request) {
			model.addAttribute("counselDetail",personalCounselDao.PersonalCounselSelect(vo));
			String pr_no = request.getParameter("pr_no");
			//System.out.println("확인:"+pr_no);
			// System.out.println("폼+ "+ personalCounselDao.PersonalCounselSelect(vo));
			return pr_no;
		}
		
	//개인상담 관리 업데이트
	@RequestMapping("/PersonalCounselUpdate.do")
	public String PersonalCounselUpdate(PersonalcounselVO vo, Model model, HttpServletRequest request ) {
		String pr_no = request.getParameter("pr_no");
		//System.out.println(request.getParameter("pc_report"));
		personalCounselDao.PersonalCounselUpdate(vo);
		//System.out.println(vo.getPr_no());
		return "redirect:counselorPersonalDetail.do?pr_no="+pr_no;
	}
	
	
	
	
	
	/* =====관리자 화면===== */

	// 오늘의 한마디 메인화면
//	@RequestMapping("/adminTodayStoryList.do")
//	public String adminTodayStoryList(Model model, TodaystoryVO vo, HttpServletRequest request) {
//		String nowPage = request.getParameter("nowPage");
//		if (nowPage == null) {
//			page = new Pagination(todayDao.CountTodayStory(), 1, 10); // 전체 수, start, end
//		} else {
//			page = new Pagination(todayDao.CountTodayStory(), Integer.parseInt(nowPage), 10); // 전체 수, start,
//			// end
//		}
//		List<TodaystoryVO> list = todayDao.TodayStorySelectList(page);
//		model.addAttribute("page",page);
//		model.addAttribute("adminTodayStoryList", list);
//		return "admin/todaystorymanage/adminTodayStoryList";
//	}

	// 오늘의 한마디 등록
	@RequestMapping("/adminTodayStoryRegister.do")
	public String adminTodayStoryRegister(Model model, TodaystoryVO vo) {
		
		model.addAttribute("adminTodayInsertForm", todayDao.TodayInsert(vo));

		return "redirect:adminTodayStoryList.do";
	}

	// 오늘의 한마디 삭제
	@RequestMapping("/adminTodayStoryDelete.do")
	@ResponseBody
	public String adminTodayStoryDelete(TodaystoryVO vo, Model model, HttpServletRequest request) {
		vo.setSc_no(request.getParameter("sc_no"));
		todayDao.TodayDelete(vo);
		return "ok";
	}

	// 오늘의 한마디 update modal form 호출
	@RequestMapping("/adminTodayStoryUpdateForm.do")
	@ResponseBody
	public String adminTodayStoryUpdateModal(TodaystoryVO vo, Model model, HttpServletRequest request) {
		model.addAttribute("adminTodayStorySelect", todayDao.AdminTodaySelect(vo));
		// System.out.println(vo);
		// System.out.println(todayDao.AdminTodaySelect(vo));
		return "ok";
	}

	// 오늘의 한마디 update 수정
	@RequestMapping("/adminTodayStoryUpdate.do")
	public String adminTodayStoryUpdate(Model model, TodaystoryVO vo, HttpServletRequest request) {
		System.out.println(request.getParameter("sc_title"));
		System.out.println(vo.getSc_no());
		model.addAttribute("adminTodayStoryUpdate", vo);
		todayDao.TodayUpdate(vo);

		return "redirect:adminTodayStoryList.do";

	}
	
}
