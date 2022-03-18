package co.maeumi.prj.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.banner.service.BannerService;
import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.coupon.service.CouponService;
import co.maeumi.prj.coupon.service.CouponVO;
import co.maeumi.prj.member.service.MemberService;
import co.maeumi.prj.service.Search;

@Controller
public class TestController {

	@Autowired
	private MemberService memberDao;
	@Autowired
	private CounselorService counselorDao;
	@Autowired
	private BannerService bannerDao;
	@Autowired
	private CouponService couponDao;

	@RequestMapping("/test.do")
	public String test(Model model) {

		return "admin/bannermanage/test";
	}

	@ResponseBody
	@RequestMapping("/testTime.do")
	public List<CounselorVO> testTime(CounselorVO cvo) {
		List<CounselorVO> list = counselorDao.counselorTimeAndDay(cvo);

		return list;
	}

	@ResponseBody
	@RequestMapping("/testTimeselect.do")
	public List<CounselorVO> testTimeselect(CounselorVO cvo) {
		List<CounselorVO> list = counselorDao.reservedCounsel(cvo);	

		return list;
	}

	@RequestMapping("/testpg.do")
	public String testpg(Model model, Search svo, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "undefined") String c_name,
			@RequestParam(required = false, defaultValue = "undefined") String c_type1,
			@RequestParam(required = false, defaultValue = "undefined") String c_type2,
			@RequestParam(required = false, defaultValue = "undefined") String c_type3,
			@RequestParam(required = false, defaultValue = "undefined") String c_type4,
			@RequestParam(required = false, defaultValue = "undefined") String c_type5,
			@RequestParam(required = false, defaultValue = "undefined") String c_type6,
			@RequestParam(required = false, defaultValue = "undefined") String p_kakao,
			@RequestParam(required = false, defaultValue = "undefined") String p_zoom,
			@RequestParam(required = false, defaultValue = "undefined") String p_phone,
			@RequestParam(required = false, defaultValue = "all") String c_gender) throws Exception {

		System.out.println("-----------------------------");
		System.out.println(c_type6);
		model.addAttribute("search", svo);
		svo.setC_name(c_name);
		svo.setC_type1(c_type1);
		svo.setC_type2(c_type2);
		svo.setC_type3(c_type3);
		svo.setC_type4(c_type4);
		svo.setC_type5(c_type5);
		svo.setC_type6(c_type6);
		svo.setP_kakao(p_kakao);
		svo.setP_zoom(p_zoom);
		svo.setP_phone(p_phone);
		svo.setC_gender(c_gender);

		System.out.println("-----------------------------");
		System.out.println(c_type6);

		int listCnt = counselorDao.getUserCounselorListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		model.addAttribute("counselorList", counselorDao.userCounselorSearchList(svo));
		return "admin/chart/test";
	}

	@RequestMapping("/test2pg.do")
	public String test2pg(Model model, CounselorVO cvo, HttpSession session, HttpServletRequest request) {
		String c_email = request.getParameter("c_email");
		session.setAttribute("c_email", c_email);
		
		model.addAttribute("counselorSelect", counselorDao.userCounselorSelect(cvo));
		return "admin/chart/test2";
	}

	@RequestMapping("/test3pg.do")
	public String test3pg(Model model, CounselorVO cvo, HttpServletRequest request, HttpSession session) {
		String type = request.getParameter("c_type1");
		String price = request.getParameter("pr_price");
		String c_value = request.getParameter("c_value");
		String c_email = request.getParameter("c_email");
		System.out.println(type);
		System.out.println(price);
		System.out.println(c_email);
		System.out.println(c_value);
		model.addAttribute("counselorSelect", counselorDao.userCounselorSelect(cvo));
		model.addAttribute("c_type1", type);
		model.addAttribute("pr_price", price);
		model.addAttribute("c_value", c_value);
		model.addAttribute("c_email", c_email);

		return "admin/chart/test3";
	}

	@RequestMapping("/test4pg.do")
	public String test4pg(Model model, CounselorVO cvo, HttpServletRequest request, CouponVO cpvo,
			HttpSession session) {
		String pr_type = request.getParameter("pr_type");
		String price = request.getParameter("pr_price");
		String c_email = request.getParameter("c_email");
		String c_value = request.getParameter("c_value");
		String pr_date = request.getParameter("pr_date");
		String pr_time = request.getParameter("pr_time");

		model.addAttribute("pr_type", pr_type);//
		model.addAttribute("pr_price", price);//
		model.addAttribute("c_email", c_email);//
		model.addAttribute("c_value",c_value);
		model.addAttribute("pr_date", pr_date);//
		model.addAttribute("pr_time", pr_time);//
		model.addAttribute("counselorSelect", counselorDao.userCounselorSelect(cvo));

		cpvo.setM_email("gnjqtpfl@naver.com");
		List<CouponVO> list = couponDao.couponMemberSelectList(cpvo);
		model.addAttribute("coupon", list);

		return "admin/chart/test4";
	}

}