package co.maeumi.prj.web;

import java.util.List;

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
		for (int i = 0; i < list.size(); i++) {
			String a = list.get(i).getPr_time();
			System.out.println(a);
		}

		return list;
	}

	@RequestMapping("/testpg.do")
	public String testpg(Model model, Search svo, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String c_name,
			@RequestParam(required = false, defaultValue = "") String c_type1,
			@RequestParam(required = false, defaultValue = "") String c_type2,
			@RequestParam(required = false, defaultValue = "") String c_type3,
			@RequestParam(required = false, defaultValue = "") String c_type4,
			@RequestParam(required = false, defaultValue = "") String c_type5,
			@RequestParam(required = false, defaultValue = "") String c_type6,
			@RequestParam(required = false, defaultValue = "") String p_kakao,
			@RequestParam(required = false, defaultValue = "") String p_zoom,
			@RequestParam(required = false, defaultValue = "") String p_phone,
			@RequestParam(required = false, defaultValue = "") String c_gender) throws Exception {
		
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
	

}