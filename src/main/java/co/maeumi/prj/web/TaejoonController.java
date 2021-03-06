package co.maeumi.prj.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.maeumi.prj.banner.service.BannerService;
import co.maeumi.prj.banner.service.BannerVO;
import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.coupon.service.CouponService;
import co.maeumi.prj.coupon.service.CouponVO;
import co.maeumi.prj.groupcounsel.service.GroupcounselService;
import co.maeumi.prj.groupcounsel.service.GroupcounselVO;
import co.maeumi.prj.member.service.MemberService;
import co.maeumi.prj.member.service.MemberVO;
import co.maeumi.prj.personalcounsel.service.PersonalcounselService;
import co.maeumi.prj.personalcounsel.service.PersonalcounselVO;
import co.maeumi.prj.salary.service.SalaryService;
import co.maeumi.prj.salary.service.SalaryVO;
import co.maeumi.prj.service.Aes256;
import co.maeumi.prj.service.Search;
import co.maeumi.prj.therapy.service.TherapyService;
import co.maeumi.prj.todaystory.service.TodaystoryService;

@Controller
public class TaejoonController {

	@Autowired
	private MemberService memberDao;
	@Autowired
	private CounselorService counselorDao;
	@Autowired
	private BannerService bannerDao;
	@Autowired
	private CouponService couponDao;
	@Autowired
	private TodaystoryService todayDao;
	@Autowired
	private TherapyService therapyDao;
	@Autowired
	private GroupcounselService groupCounselDao;
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	@Autowired
	Aes256 aes256;
	@Autowired
	private SalaryService salaryDao;
	@Autowired
	private PersonalcounselService personalCounselDao;
	@Value("#{uploadpath['upload']}")
	private String uploadpath;

	/* ===== ????????? ?????? ===== */

	@RequestMapping("/home.do")
	public String home(Model model, BannerVO bvo, PersonalcounselVO vo, GroupcounselVO gvo) {
		List<BannerVO> list = bannerDao.bannerList(bvo);
		model.addAttribute("banner", list);

		List<PersonalcounselVO> clist = personalCounselDao.CounselorList(vo);
		model.addAttribute("clist", clist);

		List<GroupcounselVO> glist = groupCounselDao.groupList(gvo);
		for (int i = 0; i < glist.size(); i++) {
			String gdate = glist.get(i).getGc_date();
			gdate = gdate.substring(0, 10);
			glist.get(i).setGc_date(gdate);
		}
		model.addAttribute("glist", glist);
		return "user/home/home";
	}

	/* ===== ????????? ?????? ===== */

	@RequestMapping("/counselorGroupList.do")
	public String counselorGroupList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String gc_title,
			@RequestParam(required = false, defaultValue = "all") String gc_type,
			@RequestParam(required = false, defaultValue = "") String gc_date,
			@RequestParam(required = false, defaultValue = "all") String gc_status, Search svo) throws Exception {

		model.addAttribute("search", svo);
		svo.setGc_title(gc_title);
		svo.setGc_type(gc_type);
		svo.setGc_date(gc_date);
		svo.setGc_status(gc_status);

		int listCnt = groupCounselDao.getGCListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		List<GroupcounselVO> list = groupCounselDao.gcSearchselect(svo);
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getGc_date();
			date = date.substring(0, 10);
			list.get(i).setGc_date(date);
			String date2 = list.get(i).getGc_startdate();
			date2 = date2.substring(0, 10);
			list.get(i).setGc_startdate(date2);
			String date3 = list.get(i).getGc_finaldate();
			date3 = date3.substring(0, 10);
			list.get(i).setGc_finaldate(date3);

		}
		model.addAttribute("groupCounsel", list);

		return "counselor/groupcounselmanage/counselorGroupList";
	}

	@RequestMapping("/counselorGroupApplyList.do")
	public String counselorGroupApplyList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false, defaultValue = "") String gr_reservedate,
			@RequestParam(required = false, defaultValue = "all") String gr_status,
			@RequestParam(required = false, defaultValue = "") String m_nickname,
			@RequestParam(required = false, defaultValue = "") String m_email, Search svo, HttpServletRequest request)
			throws Exception {

		String gc_no = request.getParameter("gc_no");
		model.addAttribute("search", svo);
		svo.setGr_status(gr_status);
		svo.setGr_reservedate(gr_reservedate);
		svo.setM_email(m_email);
		svo.setM_nickname(m_nickname);

		int listCnt = groupCounselDao.getGCapplyListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		List<GroupcounselVO> list = groupCounselDao.gcApplySearchselect(svo);
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getGr_reservedate();
			date = date.substring(0, 10);
			list.get(i).setGr_reservedate(date);
		}
		model.addAttribute("apply", list);
		model.addAttribute("gc_no", gc_no);

		return "counselor/groupcounselmanage/counselorGroupApplyList";
	}

	@RequestMapping("/counselorGroupInfo.do")
	public String counselorGroupInfo(Model model, GroupcounselVO gvo) throws ParseException {

		gvo = groupCounselDao.selectGroupCounselInfo(gvo);

		String date = gvo.getGc_date();
		date = date.substring(0, 10);
		gvo.setGc_date(date);

		String startdate = gvo.getGc_startdate();
		startdate = startdate.substring(0, 10);
		gvo.setGc_startdate(startdate);

		String finaldate = gvo.getGc_finaldate();
		finaldate = finaldate.substring(0, 10);
		gvo.setGc_finaldate(finaldate);

		model.addAttribute("gc", gvo);

		return "counselor/groupcounselmanage/counselorGroupInfo";
	}

	@RequestMapping("/groupCounselUpdate.do")
	public String groupCounselUpdate(Model model, GroupcounselVO vo, HttpServletResponse response,
			@RequestParam(value = "filename") MultipartFile mf, HttpServletRequest req) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// ????????? ???????????????
		String SAVE_PATH = uploadpath + "/counselorpicture/";
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID??? ????????? ??????????????? ?????????.
		String msaveFile = SAVE_PATH + uuid + originalFileName; // ?????? ??????????????? ????????? ????????????.
		String saveFile = uuid + originalFileName;
		vo.setGc_sumnail(saveFile);
		try {
			mf.transferTo(new File(msaveFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// ???????????? ?????? ??????
		// ????????? ????????? ?????? ?????? ????????? ??????.
		// ???????????? ????????? ?????????????????? ?????? ???????????? ?????? ????????? ????????? ??????.

		String origincode = req.getParameter("summernote");
		String result = origincode.replaceAll(req.getContextPath() + "/resources/fileupload/", "editor/");
		vo.setGc_infos(result);

		int update = groupCounselDao.groupCounselUpdate(vo);

		// vo?????? ?????? ?????? ?????? ?????? ??????
		if (update != 1) {
			out.println("<script>alert('?????? ????????? ?????? ??????'); history.back(); </script>");
			out.flush();
		} else {
			out.println("<script>alert('?????? ????????? ?????? ??????'); location.href='counselorGroupList1.do'</script>");
			out.flush();
		}
		return null;
	}

	@ResponseBody
	@RequestMapping("/groupCounselClose.do")
	public int groupCounselClose(GroupcounselVO gvo) {
		int n = groupCounselDao.groupCounselClose(gvo);

		return n;
	}

	@ResponseBody
	@RequestMapping("/groupCounselDetailInsert.do")
	public int groupCounselDetailInsert(GroupcounselVO gvo, HttpServletRequest request) throws Exception {
		System.out.println(request.getParameter("gc_report"));
		String gc_report = aes256.encrypt(request.getParameter("gc_report"));
		System.out.println(gc_report);
		System.out.println(aes256.decrypt(gc_report));
		gvo.setGc_report(gc_report);
		int n = groupCounselDao.groupCounselResult(gvo);

		return n;
	}

	// ????????? ??????????????? ????????????
	@RequestMapping("/counselorMyPageMain.do")
	public String counselorMyPageMain(Model model, CounselorVO cvo, HttpSession session) {

		String c_email = (String) session.getAttribute("c_email");

		cvo.setC_email(c_email);
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));

		List<CounselorVO> careerList = counselorDao.counselorCareerList(cvo);
		model.addAttribute("career", careerList);

		List<CounselorVO> certificationList = counselorDao.counselorCertificationList(cvo);
		for (int i = 0; i < certificationList.size(); i++) {
			String date = certificationList.get(i).getCcf_date();
			date = date.substring(0, 10);
			certificationList.get(i).setCcf_date(date);
		}
		model.addAttribute("certification", certificationList);

		List<CounselorVO> infoList = counselorDao.counselorinfoList(cvo);
		model.addAttribute("info", infoList);

		List<CounselorVO> timeList = counselorDao.counselortimeList(cvo);
		model.addAttribute("time", timeList);

		return "counselor/mypage/counselorMyPageMain";
	}

	// ????????? ??????????????? - ????????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "/counselorPicture.do", produces = "application/text; charset=utf8")
	public String memberPictures(CounselorVO vo, @RequestParam(value = "filename") MultipartFile mf, Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		String c_email = (String) session.getAttribute("c_email");
		String SAVE_PATH = uploadpath + "/counselorpicture/";
		System.out.println(SAVE_PATH);
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID??? ????????? ??????????????? ?????????.

		String msaveFile = SAVE_PATH + uuid + originalFileName; // ?????? ??????????????? ????????? ????????????.
		System.out.println(originalFileName);
		String saveFile = uuid + originalFileName;
		System.out.println(saveFile);
		System.out.println(msaveFile);
		vo.setC_picture(originalFileName);
		vo.setC_picturepath(saveFile);
		vo.setC_email(c_email);
		try {
			mf.transferTo(new File(msaveFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		counselorDao.counselorPictureUpdate(vo);
		return "img/" + saveFile;
	}

	// ????????? ??????????????? - ??? ?????? ?????? / ????????? ?????? ?????? ?????? ??????
	@RequestMapping("/counselorMyPageInfo.do")
	public String counselorMyPageInfo(Model model, CounselorVO cvo, HttpSession session) {

		String c_email = (String) session.getAttribute("c_email");

		cvo.setC_email(c_email);
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));
		List<CounselorVO> list = counselorDao.counselorGradeList(cvo);
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getCu_applydate();
			date = date.substring(0, 10);
			list.get(i).setCu_applydate(date);
		}
		model.addAttribute("apply", list);
		model.addAttribute("price", counselorDao.counselorPriceSelect(cvo));
		return "counselor/mypage/counselorMyPageInfo";
	}

	@RequestMapping("/fileDownload2.do")
	public void fileDownload2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String filename = request.getParameter("fileName"); // noticeRead.jsp?????? get???????????? ?????? name???????????? filename???.
		String encodingFilename = "";
		System.out.println("1. filename: " + filename);
		String realFilename = "";

		String downName = request.getParameter("downName");
		System.out.println("downName ?????? : " + downName);

		try {
			String browser = request.getHeader("User-Agent");
			// ?????? ?????????
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				encodingFilename = URLEncoder.encode(downName, "UTF-8").replaceAll("\\+", "%20");
				System.out.println("2. filename: " + downName);
			} else {
				encodingFilename = new String(downName.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		realFilename = uploadpath + "/counselorgrade/" + filename;
		System.out.println("3. realfilename: " + realFilename);
		File file1 = new File(realFilename);
		if (!file1.exists()) {
			System.out.println("???????????? ?????? ~=================");
			return;
		}
		// ????????? ??????
		System.out.println("encodingFilename??? ??????: " + encodingFilename);
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + encodingFilename + "\"");

		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (Exception e) {
			System.out.println("FileNotFoundException : " + e);
		}

	}

	@RequestMapping("/catesubmit.do")
	public String catesubmit(Model model, CounselorVO cvo) {
		counselorDao.counselorCateUpdate(cvo);
		counselorDao.counselorPriceUpdate(cvo);
		return "redirect:counselorMyPageInfo.do";
	}

	// ????????? ??????????????? - ????????? ?????? ?????? ??????
	@ResponseBody
	@RequestMapping(value = "/counselorUpgradeApply.do", produces = "application/text; charset=utf8")
	public String counselorUpgradeApply(Model model, CounselorVO cvo,
			@RequestParam(value = "filename1") MultipartFile mf, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {

		String SAVE_PATH = uploadpath + "/counselorgrade/";

		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID??? ????????? ??????????????? ?????????.

		String msaveFile = SAVE_PATH + uuid + originalFileName; // ?????? ??????????????? ????????? ????????????.
		System.out.println(originalFileName);
		String saveFile = uuid + originalFileName;
		if (originalFileName == null) {

		}
		cvo.setCu_filename(originalFileName);
		cvo.setCu_pfilename(saveFile);
		try {
			mf.transferTo(new File(msaveFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		String c_email = (String) session.getAttribute("c_email");
		cvo.setC_email(c_email);
		counselorDao.counselorGradeInsert(cvo);

		return "img/" + saveFile;
	}

	// ????????? ??????????????? - ?????? ?????? ?????? ??????
	@RequestMapping("/counselorMyPageCareer.do")
	public String counselorMyPageCareer(Model model, CounselorVO cvo, HttpSession session) {

		String c_email = (String) session.getAttribute("c_email");

		cvo.setC_email(c_email);
		List<CounselorVO> list = counselorDao.counselorCareerList(cvo);
		model.addAttribute("career", list);
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));
		return "counselor/mypage/counselorMyPageCareer";
	}

	// ????????? ??????????????? - ?????? ?????? ??????
	@ResponseBody
	@RequestMapping("/careerupdate.do")
	public String careerupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo,
			HttpSession session) throws Exception {

		String c_email = (String) session.getAttribute("c_email");

		cvo.setC_email(c_email);
		counselorDao.counselorCareerDelete(cvo);

		for (int i = 0; i < list.size(); i++) {
			String cc_status = list.get(i).get("cc_status").toString();
			String cc_subject = list.get(i).get("cc_subject").toString();

			cvo.setCc_status(cc_status);
			cvo.setCc_subject(cc_subject);
			counselorDao.counselorCareerInsert(cvo);
		}

		return "OK";
	}

	// ????????? ??????????????? - ???????????? ?????? ??????
	@RequestMapping("/counselorMyPageCert.do")
	public String counselorMyPageCert(Model model, CounselorVO cvo, HttpSession session) {
		String c_email = (String) session.getAttribute("c_email");
		cvo.setC_email(c_email);
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));

		List<CounselorVO> list = counselorDao.counselorCertificationList(cvo);
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getCcf_date();
			date = date.substring(0, 10);
			list.get(i).setCcf_date(date);
		}
		model.addAttribute("certification", list);

		return "counselor/mypage/counselorMyPageCert";
	}

	// ????????? ??????????????? - ???????????? ??????
	@ResponseBody
	@RequestMapping("/certificationupdate.do")
	public String certificationupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo,
			HttpSession session) throws Exception {

		String c_email = (String) session.getAttribute("c_email");

		cvo.setC_email(c_email);
		counselorDao.counselorCertificationDelete(cvo);

		for (int i = 0; i < list.size(); i++) {
			String ccf_name = list.get(i).get("ccf_name").toString();
			String ccf_issueby = list.get(i).get("ccf_issueby").toString();
			String ccf_date = list.get(i).get("ccf_date").toString();

			cvo.setCcf_name(ccf_name);
			cvo.setCcf_issueby(ccf_issueby);
			cvo.setCcf_date(ccf_date);

			counselorDao.counselorCertificationInsert(cvo);
		}

		return "OK";
	}

	// ????????? ??????????????? - ??? ???????????? ?????? ??????
	@RequestMapping("/counselorMyPageTime.do")
	public String counselorMyPageTime(Model model, CounselorVO cvo, HttpSession session) {
		String c_email = (String) session.getAttribute("c_email");
		cvo.setC_email(c_email);
		List<CounselorVO> list = counselorDao.counselortimeList(cvo);

		model.addAttribute("time", list);

		return "counselor/mypage/counselorMyPageTime";
	}

	// ????????? ??????????????? - ???????????? ??????
	@ResponseBody
	@RequestMapping("/counseltimeupdate.do")
	public String counseltimeupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo,
			HttpSession session) throws Exception {

		String c_email = (String) session.getAttribute("c_email");
		cvo.setC_email(c_email);
		counselorDao.counselortimeDelete(cvo);

		for (int i = 0; i < list.size(); i++) {
			String cd_day = list.get(i).get("cd_day").toString();
			String cd_time = list.get(i).get("cd_time").toString();
			cvo.setCd_day(cd_day);
			cvo.setCd_time(cd_time);

			counselorDao.counselortimeInsert(cvo);
		}

		return "OK";
	}

	// ????????? ??????????????? - ????????? ?????? ?????? ??????
	@RequestMapping("/counselorMyPageIntro.do")
	public String counselorMyPageIntro(Model model, CounselorVO cvo, HttpSession session) {
		String c_email = (String) session.getAttribute("c_email");
		cvo.setC_email(c_email);
		model.addAttribute("info", counselorDao.counselorinfoList(cvo));

		return "counselor/mypage/counselorMyPageIntro";
	}

	// ????????? ??????????????? - ????????? ?????? ??????
	@ResponseBody
	@RequestMapping("/infoupdate.do")
	public String infoupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo,
			HttpSession session) throws Exception {

		String c_email = (String) session.getAttribute("c_email");
		cvo.setC_email(c_email);
		counselorDao.counselorinfoDelete(cvo);

		for (int i = 0; i < list.size(); i++) {
			String ci_title = list.get(i).get("ci_title").toString();
			String ci_subject = list.get(i).get("ci_subject").toString();

			cvo.setCi_title(ci_title);
			cvo.setCi_subject(ci_subject);

			counselorDao.counselorinfoInsert(cvo);
		}

		return "OK";
	}

	// ????????? ??????
	@RequestMapping("/counselorStatistics.do")
	public String counselorStatistics(Model model, HttpSession session, PersonalcounselVO pcvo) {

		return "counselor/statistics/counselorStatistics";
	}

	@ResponseBody
	@RequestMapping("/counselorStatisticData.do")
	public List<PersonalcounselVO> counselorStatisticData(Model model, PersonalcounselVO pcvo, HttpSession session) {
		String c_email = (String) session.getAttribute("c_email");

		pcvo.setC_email(c_email);
		List<PersonalcounselVO> data = personalCounselDao.searchCounselData(pcvo);

		return data;
	}

	@ResponseBody
	@RequestMapping("/counselorDataSearch.do")
	public List<PersonalcounselVO> counselorDataSearch(Model model, PersonalcounselVO pcvo, HttpSession session) {
		String c_email = (String) session.getAttribute("c_email");

		pcvo.setC_email(c_email);
		List<PersonalcounselVO> data = personalCounselDao.searchCounselData2(pcvo);

		return data;
	}

	/* ===== ????????? ?????? ===== */

	@RequestMapping("/adminhome.do")
	public String adminhome() {
		return "admin/adminhome/adminHome";
	}

	// ????????? - ???????????? ?????? ????????????
	@RequestMapping("/adminMemberList.do")
	public String adminMemberList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String m_nickname, @RequestParam(required = false) String m_email,
			@RequestParam(required = false) String m_phone,
			@RequestParam(required = false, defaultValue = "all") String m_type, Search svo) throws Exception {

		model.addAttribute("search", svo);

		int listCnt = memberDao.getMemberListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		List<MemberVO> list = memberDao.memberSearchselect(svo);
		for (int i = 0; i < list.size(); i++) {
			String phone = list.get(i).getM_phone();
			String phone1 = phone.substring(0, 3);
			String phone2 = phone.substring(3, 7);
			String phone3 = phone.substring(7, 11);
			phone = phone1 + "-" + phone2 + "-" + phone3;
			list.get(i).setM_phone(phone);
		}
		model.addAttribute("member", list);

		return "admin/membermanage/adminMemberList";
	}

	@RequestMapping("/adminMemberDetail.do")
	public String adminMemberDetail(Model model, MemberVO mvo, CouponVO cvo) {

		model.addAttribute("member", memberDao.memberSelect(mvo));

		List<CouponVO> list = couponDao.couponSelect(cvo);
		for (int i = 0; i < list.size(); i++) {

			String sdate = list.get(i).getC_startdate();
			String fdate = list.get(i).getC_finaldate();

			sdate = sdate.substring(0, 10);
			fdate = fdate.substring(0, 10);

			list.get(i).setC_startdate(sdate);
			list.get(i).setC_finaldate(fdate);
		}

		model.addAttribute("coupon", list);

		return "admin/membermanage/adminMemberDetail";
	}

	@ResponseBody
	@RequestMapping("/adminUserInfoUpdate.do")
	public String adminUserInfoUpdate(Model model, MemberVO mvo) {
		memberDao.memberInfoUpdate(mvo);

		return "OK";
	}

	// ????????? - ????????? ?????? ????????????
	@RequestMapping("/adminCounselorList.do")
	public String adminCounselorList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String c_name,
			@RequestParam(required = false, defaultValue = "all") String c_gender,
			@RequestParam(required = false, defaultValue = "all") String c_grade,
			@RequestParam(required = false, defaultValue = "") String c_birthdate,
			@RequestParam(required = false) String c_email, @RequestParam(required = false) String c_phone,
			@RequestParam(required = false) String c_address,
			@RequestParam(required = false, defaultValue = "all") String c_status, Search svo) throws Exception {

		model.addAttribute("search", svo);
		svo.setC_name(c_name);
		svo.setC_gender(c_gender);
		svo.setC_grade(c_grade);
		svo.setC_birthdate(c_birthdate);
		svo.setC_email(c_email);
		svo.setC_phone(c_phone);
		svo.setC_address(c_address);
		svo.setC_status(c_status);

		int listCnt = counselorDao.getCounselorListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);

		List<CounselorVO> list = counselorDao.counselorSearchselect(svo);

		for (int i = 0; i < list.size(); i++) {

			String date = list.get(i).getC_birthdate();
			date = date.substring(0, 10);
			list.get(i).setC_birthdate(date);
		}

		for (int i = 0; i < list.size(); i++) {
			String phone = list.get(i).getC_phone();
			String phone1 = phone.substring(0, 3);
			String phone2 = phone.substring(3, 7);
			String phone3 = phone.substring(7, 11);
			phone = phone1 + "-" + phone2 + "-" + phone3;
			list.get(i).setC_phone(phone);
		}

		for (int i = 0; i < list.size(); i++) {
			String admin = list.get(i).getC_admin();
			if (admin.equals("A")) {
				list.remove(i);
			}
		}

		model.addAttribute("counselor", list);

		return "admin/membermanage/adminCounselorList";
	}

	@RequestMapping("/adminCounselorDetail.do")
	public String adminCounselorDetail(Model model, CounselorVO cvo) {

		cvo = counselorDao.counselorSelect(cvo);

		String birthdate = cvo.getC_birthdate();
		birthdate = birthdate.substring(0, 10);
		cvo.setC_birthdate(birthdate);
		List<CounselorVO> list = counselorDao.counselorGradeList(cvo);
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getCu_applydate();
			date = date.substring(0, 10);
			list.get(i).setCu_applydate(date);
		}
		model.addAttribute("counselor", cvo);
		model.addAttribute("apply", list);

		return "admin/membermanage/adminCounselorDetail";
	}

	@ResponseBody
	@RequestMapping("/adminCounselorGradeComfirm.do")
	public String adminCounselorGradeComfirm(CounselorVO cvo) {

		counselorDao.counselorGradeUpdate(cvo);
		counselorDao.counselorUpdate(cvo);

		return "OK";
	}

	@RequestMapping("/adminCounselorGradeReject.do")
	public String adminCounselorGradeReject(CounselorVO cvo, Model model, HttpServletRequest request) {

		counselorDao.counselorGradeUpdate(cvo);

		cvo.setC_email(request.getParameter("c_email"));
		cvo = counselorDao.counselorSelect(cvo);

		String birthdate = cvo.getC_birthdate();
		birthdate = birthdate.substring(0, 10);
		cvo.setC_birthdate(birthdate);
		List<CounselorVO> list = counselorDao.counselorGradeList(cvo);
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getCu_applydate();
			date = date.substring(0, 10);
			list.get(i).setCu_applydate(date);
		}
		model.addAttribute("counselor", cvo);
		model.addAttribute("apply", list);

		return "admin/membermanage/adminCounselorDetail";
	}

	@RequestMapping("/adminBannerList.do")
	public String adminBannerList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range, Search svo, CouponVO cvo) throws Exception {

		model.addAttribute("search", svo);
		int listCnt = bannerDao.getBannerListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		model.addAttribute("banner", bannerDao.bannerSelectList(svo));
		model.addAttribute("coupon", couponDao.couponSelectList());
		return "admin/bannermanage/adminBannerList";
	}

	@RequestMapping("/adminBannerDetail.do")
	public String adminBannerDetail(Model model, BannerVO bvo) {

		model.addAttribute("banner", bannerDao.bannerSelect(bvo));

		return "admin/bannermanage/adminBannerDetail";
	}

	@RequestMapping("/adminBannerUpdate.do")
	public String adminBannerUpdate(Model model, BannerVO bvo) {
		bannerDao.bannerUpdate(bvo);

		return "redirect:adminBannerList.do";
	}

	@RequestMapping("/adminBannerInsertForm.do")
	public String adminBannerInsertForm() {

		return "admin/bannermanage/adminBannerInsertForm";
	}

	@ResponseBody
	@RequestMapping(value = "/adminBannerInsert.do", produces = "application/text; charset=utf8")
	public String adminBannerInsert(Model model, BannerVO bvo, @RequestParam(value = "filename") MultipartFile mf,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {

		String SAVE_PATH = uploadpath + "/bannerimg/";
		System.out.println(SAVE_PATH);

		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID??? ????????? ??????????????? ?????????.

		String msaveFile = SAVE_PATH + uuid + originalFileName; // ?????? ??????????????? ????????? ????????????.
		System.out.println(originalFileName);
		String saveFile = uuid + originalFileName;
		if (originalFileName == null) {

		}
		bvo.setBn_filename(originalFileName);
		bvo.setBn_pfilename(saveFile);
		try {
			mf.transferTo(new File(msaveFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		bannerDao.bannerInsert(bvo);

		return "img/" + saveFile;
	}

	@ResponseBody
	@RequestMapping("/adminDeleteBanner.do")
	public String adminDeleteBanner(BannerVO bvo, Model model) {

		bannerDao.bannerDelete(bvo);

		return "redirect:adminBannerList.do";
	}

	@RequestMapping("/fileDownload1.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String filename = request.getParameter("fileName"); // get???????????? ?????? name???????????? filename???.
		String encodingFilename = "";
		String realFilename = "";
		String downName = request.getParameter("downName");
		try {
			String browser = request.getHeader("User-Agent");
			// ?????? ?????????
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				encodingFilename = URLEncoder.encode(downName, "UTF-8").replaceAll("\\+", "%20");
			} else {
				encodingFilename = new String(downName.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch (UnsupportedEncodingException ex) {
			System.out.println("UnsupportedEncodingException");
		}
		realFilename = uploadpath + "/counselorgrade/" + filename;
		File file1 = new File(realFilename);
		if (!file1.exists()) {
			return;
		}
		// ????????? ??????
		System.out.println("encodingFilename??? ??????: " + encodingFilename);
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + encodingFilename + "\"");

		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFilename);

			int ncount = 0;
			byte[] bytes = new byte[512];

			while ((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			fis.close();
			os.close();
		} catch (Exception e) {
			System.out.println("FileNotFoundException : " + e);
		}

	}

	@RequestMapping("/adminTodayStoryList.do")
	public String adminTodayStoryList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range, Search svo) throws Exception {

		model.addAttribute("search", svo);
		int listCnt = todayDao.getTodayListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		model.addAttribute("adminTodayStoryList", todayDao.todaySearchselect(svo));
		return "admin/todaystorymanage/adminTodayStoryList";
	}

	@RequestMapping("/admintherapy.do")
	public String admintherapyList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String t_name, @RequestParam(required = false) String t_title, Search svo)
			throws Exception {

		model.addAttribute("search", svo);

		int listCnt = therapyDao.getTherapyListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		model.addAttribute("therapy", therapyDao.therapySearchselect(svo));

		return "admin/therapy/therapyList";
	}

	@RequestMapping("/adminSalesChart.do")
	public String adminSalesChart(Model model) {

		return "admin/chart/adminSalesChart";
	}

	@ResponseBody
	@RequestMapping("/adminSalaryData.do")
	public List<SalaryVO> adminSalaryData(Model model, SalaryVO vo) {
		List<SalaryVO> salary = salaryDao.salaryList();

		return salary;
	}

	@ResponseBody
	@RequestMapping("/adminSalarySearch.do")
	public List<SalaryVO> adminSalarySearch(Model model, SalaryVO vo) {
		List<SalaryVO> salary = salaryDao.salarySearch(vo);
		for (int i = 0; i < salary.size(); i++) {
			if (salary.get(i).getS_sdate() != null) {
				String date = salary.get(i).getS_sdate();
				date = date.substring(0, 10);
				salary.get(i).setS_sdate(date);
			}
		}

		return salary;
	}

	@ResponseBody
	@RequestMapping("/adminHomeData1.do")
	public List<SalaryVO> adminHomeData1(Model model, SalaryVO vo) {
		List<SalaryVO> salary = salaryDao.salaryList();

		return salary;
	}

	@ResponseBody
	@RequestMapping("/adminHomeData2.do")
	public List<SalaryVO> adminHomeData2(Model model, SalaryVO vo) {
		List<SalaryVO> salary = salaryDao.salaryList2();
		for (int i = 0; i < salary.size(); i++) {
			String date = salary.get(i).getS_sdate();
			date = date.substring(5, 10);
			salary.get(i).setS_sdate(date);
		}

		return salary;
	}
}