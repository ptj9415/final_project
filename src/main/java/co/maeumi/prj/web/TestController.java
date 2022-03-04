package co.maeumi.prj.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.banner.service.BannerService;
import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.coupon.service.CouponService;
import co.maeumi.prj.member.service.MemberService;

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
		for(int i = 0; i < list.size(); i++) {
			String a = list.get(i).getPr_time();
			System.out.println(a);
		}
				
		return list;
	}

}