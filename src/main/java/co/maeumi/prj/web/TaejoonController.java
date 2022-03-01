package co.maeumi.prj.web;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.member.service.MemberService;
import co.maeumi.prj.service.Search;

@Controller
public class TaejoonController {

	@Autowired
	private MemberService memberDao;
	@Autowired
	private CounselorService counselorDao;

	/* ===== 상담사 화면 ===== */
	
	//상담사 마이페이지 메인화면	
	@RequestMapping("/counselorMyPageMain.do")
	public String counselorMyPageMain(Model model, CounselorVO cvo, HttpSession session) {
//				String c_email = (String)session.getAttribute("email");
		String c_email = "3244509@naver.com";
		session.setAttribute("email", c_email);
		session.setAttribute("name", "상담사");
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

	// 상담사 마이페이지 - 프로필 사진 변경
	@ResponseBody
	@RequestMapping(value = "/counselorPicture.do", produces = "application/text; charset=utf8")
	public String memberPictures(CounselorVO vo, @RequestParam(value = "filename") MultipartFile mf, Model model,
			HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String SAVE_PATH = "C:\\Users\\admin\\git\\final_project\\src\\main\\webapp\\img\\counselorpicture\\";
		System.out.println(SAVE_PATH);
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID를 통해서 물리파일명 만들기.

		String msaveFile = SAVE_PATH + uuid + originalFileName; // 원본 확장자명을 찾아서 붙여준다.
		System.out.println(originalFileName);
		String saveFile = uuid + originalFileName;
		System.out.println(saveFile);
		System.out.println(msaveFile);
		vo.setC_picture(originalFileName);
		vo.setC_picturepath(saveFile);
		vo.setC_email("3244509@naver.com");
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

	// 상담사 마이페이지 - 내 정보 수정 / 상담사 등급 변경 신청 화면
	@RequestMapping("/counselorMyPageInfo.do")
	public String counselorMyPageInfo(Model model, CounselorVO cvo) {

		cvo.setC_email("3244509@naver.com");
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));
		return "counselor/mypage/counselorMyPageInfo";
	}

	// 상담사 마이페이지 - 상담 경력 수정 화면
	@RequestMapping("/counselorMyPageCareer.do")
	public String counselorMyPageCareer(Model model, CounselorVO cvo) {
		String c_email = "3244509@naver.com";
		cvo.setC_email(c_email);
		List<CounselorVO> list = counselorDao.counselorCareerList(cvo);
		model.addAttribute("career", list);
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));
		return "counselor/mypage/counselorMyPageCareer";
	}

	// 상담사 마이페이지 - 상담 경력 수정
	@ResponseBody
	@RequestMapping("/careerupdate.do")
	public String careerupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo)
			throws Exception {

		cvo.setC_email("3244509@naver.com");
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

	// 상담사 마이페이지 - 자격사항 수정 화면
	@RequestMapping("/counselorMyPageCert.do")
	public String counselorMyPageCert(Model model, CounselorVO cvo) {
		String c_email = "3244509@naver.com";
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

	// 상담사 마이페이지 - 자격사항 수정
	@ResponseBody
	@RequestMapping("/certificationupdate.do")
	public String certificationupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo)
			throws Exception {

		cvo.setC_email("3244509@naver.com");
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

	// 상담사 마이페이지 - 내 상담시간 수정 화면
	@RequestMapping("/counselorMyPageTime.do")
	public String counselorMyPageTime(Model model, CounselorVO cvo) {
		cvo.setC_email("3244509@naver.com");
		List<CounselorVO> list = counselorDao.counselortimeList(cvo);

		model.addAttribute("time", list);

		return "counselor/mypage/counselorMyPageTime";
	}

	// 상담사 마이페이지 - 상담시간 수정
	@ResponseBody
	@RequestMapping("/counseltimeupdate.do")
	public String counseltimeupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo)
			throws Exception {

		cvo.setC_email("3244509@naver.com");
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

	// 상담사 마이페이지 - 상담사 소개 수정 화면
	@RequestMapping("/counselorMyPageIntro.do")
	public String counselorMyPageIntro(Model model, CounselorVO cvo) {
		cvo.setC_email("3244509@naver.com");
		model.addAttribute("info", counselorDao.counselorinfoList(cvo));

		return "counselor/mypage/counselorMyPageIntro";
	}

	// 상담사 마이페이지 - 상담사 소개 수정
	@ResponseBody
	@RequestMapping("/infoupdate.do")
	public String infoupdate(Model model, @RequestBody List<Map<String, Object>> list, CounselorVO cvo)
			throws Exception {

		cvo.setC_email("3244509@naver.com");
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

	/* ===== 관리자 화면 ===== */

	// 관리자 - 일반회원 관리 메인화면
	@RequestMapping(value = "adminMemberList.do")
	public String adminMemberList(Model model, @RequestParam(required = false, defaultValue = "1") int page,
			@RequestParam(required = false, defaultValue = "1") int range,
			@RequestParam(required = false) String m_nickname, @RequestParam(required = false) String m_email,
			@RequestParam(required = false) String m_phone,
			@RequestParam(required = false, defaultValue = "all") String m_type, @ModelAttribute("search") Search svo)
			throws Exception {

		model.addAttribute("search", svo);
		svo.setM_email(m_email);
		svo.setM_nickname(m_nickname);
		svo.setM_type(m_type);
		svo.setM_phone(m_phone);

		int listCnt = memberDao.getMemberListCnt(svo);

		svo.pageinfo(page, range, listCnt);

		model.addAttribute("pagination", svo);
		model.addAttribute("member", memberDao.memberSearchselect(svo));

		return "admin/membermanage/adminMemberList";
	}

}