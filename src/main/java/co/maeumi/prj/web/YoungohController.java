package co.maeumi.prj.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import co.maeumi.prj.groupcounsel.service.GroupcounselService;
import co.maeumi.prj.groupcounsel.service.GroupcounselVO;
import co.maeumi.prj.service.Pagination;
import co.maeumi.prj.therapy.service.TherapyService;
import co.maeumi.prj.therapy.service.TherapyVO;

@Controller
public class YoungohController {

	@Autowired
	private GroupcounselService groupCounselDao;

	@Autowired
	private TherapyService therapyDao;

	Pagination page;

	/* ===== 사용자 화면 ===== */

	/* ===== 상담사 화면 ===== */

	// 이미지 보여주기 밑 이미지 업로드 아작스.
	@RequestMapping(value = "/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		// 일반 파일 물리 경로
		// String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.

		// 경로 할 때 마다 계속 바꿔줘야함 아니면 절대 에디터 이미지 업로드 안됨.
		// Eclipse 파일 물리 경로 방식 (이클립스 내부에 저장)
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\editor\\";

		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot + "resources/fileupload/";

		String originalFileName = multipartFile.getOriginalFilename(); // 오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일 확장자
		String savedFileName = UUID.randomUUID() + extension; // 저장될 파일 명

		File targetFile = new File(fileRoot + savedFileName);
		File mtargetFile = new File(SAVE_PATH + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile); // 파일 저장
			multipartFile.transferTo(mtargetFile); // 다운로드 컨트롤러 만들고 뒤에 파일명 넣어주면 해당경로 파일을 다운로드해준다.
			jsonObject.addProperty("url", "/prj/resources/fileupload/" + savedFileName);
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");

		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile); // 저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println(a);
		return a;
	}

	@RequestMapping("/summernote.do")
	public String summernote(Model model, GroupcounselVO vo, HttpServletResponse response,
			@RequestParam(value = "filename") MultipartFile mf, HttpServletRequest req) throws IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		// vo값에 따라 성공 실패 여부 확인
		if (vo == null) {
			out.println("<script>alert('상담 페이지 개설 실패'); </script>");
			out.flush();
			return "counselor/groupcounselmanage/counselorGroupList";
		}
		out.println("<script>alert('상담 페이지 개설 성공'); </script>");
		out.flush();

		// 썸네일 파일업로드
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\editorsumnail\\";
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID를 통해서 물리파일명 만들기.
		String msaveFile = SAVE_PATH + uuid + originalFileName; // 원본 확장자명을 찾아서 붙여준다.
		String saveFile = uuid + originalFileName;
		vo.setGc_sumnail(saveFile);
		try {
			mf.transferTo(new File(msaveFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// 서머노트 코드 원본
		String origincode = req.getParameter("summernote");
		System.out.println(origincode);
		// 이미지 파일일 경우 코드 잘라서 쓰기.
		// 홈페이지 구조상 이미지파일이 먼저 들어가야 되기 때문에 이렇게 만듬.
		if (origincode.contains("src=")) {
			String editedcode = origincode.substring(0, origincode.indexOf("src=") + 5) + "editor/"
					+ origincode.substring(origincode.indexOf("src=") + 31);
			System.out.println(editedcode);
			vo.setGc_infos(editedcode);
		} else {
			vo.setGc_infos(origincode);
		}
		groupCounselDao.insertGroupCounsel(vo);
		return "counselor/groupcounselmanage/counselorGroupList";
	}

	@RequestMapping("/counselorGroupList.do")
	public String counselorGroupList(Model model, HttpServletRequest request) {
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			page = new Pagination(groupCounselDao.countGroupCounsel(), 1, 5); // 전체 수, start, end
		} else {
			page = new Pagination(groupCounselDao.countGroupCounsel(), Integer.parseInt(nowPage), 5); // 전체 수, start,
																										// end
		}

		// 리스트 타입 담아주기
		List<GroupcounselVO> list = groupCounselDao.pageSelectList(page);

		// date타입 짤라서 연월일로 보여주기
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getGc_date();
			date = date.substring(0, 10);
			list.get(i).setGc_date(date);
			String date2 = list.get(i).getGc_startdate();
			date2 = date.substring(0, 10);
			list.get(i).setGc_startdate(date2);
			String date3 = list.get(i).getGc_finaldate();
			date3 = date.substring(0, 10);
			list.get(i).setGc_finaldate(date3);

		}
		request.setAttribute("groupCounsel", list);
		request.setAttribute("page", page);
		return "counselor/groupcounselmanage/counselorGroupList";
	}

	// 상담 관리 - 그룹상담 관리 화면 다중 검색 및 페이징.
	// 페이징을 하기 위해선 pagination 이라는 VO 클래스에 담아야 하기 때문에 따로 requestparam 으로 불러와줘서 담아줘야
	// 함.
	// 페이징을 하려면 pagination이라는 클래스 안에 검색 조건을 걸어줄 변수들을 생성하고 넣어줘야함.
	@RequestMapping("/groupsearchmanage.do")
	public String groupsearchmanage(@Param("gc_title") String gc_title, @Param("gc_startdate") String gc_startdate,
			@Param("gc_finaldate") String gc_finaldate, @Param("gc_date") String gc_date, Model model,
			HttpServletRequest request, HttpSession session) {// @Param("gc_type") String gc_type, @Param("gc_status")
																// String gc_status,
		session = request.getSession();
		String nowPage = request.getParameter("nowPage");
		// 검색 기능에서 가지고 있는 세션값 지워주기
		System.out.println(nowPage);
		System.out.println(gc_title);
		System.out.println(gc_startdate);
		System.out.println(gc_finaldate);
		System.out.println(gc_date);
		// get 방식으로 가져오기 때문에 nowPage는 jsp 페이지에서 가져온다.
		// 세션값 넣어주기.

		if (gc_title != null && gc_startdate != null && gc_finaldate != null && gc_date != null) {
			session.setAttribute("gc_title", gc_title);
			session.setAttribute("gc_date", gc_date);
			session.setAttribute("gc_startdate", gc_startdate);
			session.setAttribute("gc_finaldate", gc_finaldate);
		} else {
			if ((String) session.getAttribute("gc_title") == null && (String) session.getAttribute("gc_date") == null
					&& (String) session.getAttribute("gc_startdate") == null
					&& (String) session.getAttribute("gc_finaldate") == null) {
				session.setAttribute("gc_title", gc_title);
				session.setAttribute("gc_date", gc_date);
				session.setAttribute("gc_startdate", gc_startdate);
				session.setAttribute("gc_finaldate", gc_finaldate);
			}
		}

		// pagination 객체에 담아줄 setter 선언
		page.setGc_title((String) session.getAttribute("gc_title"));
		page.setGc_date((String) session.getAttribute("gc_date"));
		page.setGc_startdate((String) session.getAttribute("gc_startdate"));
		page.setGc_finaldate((String) session.getAttribute("gc_finaldate"));
		page.setGc_type((String) session.getAttribute("gc_type"));
		page.setGc_status((String) session.getAttribute("gc_type"));

		if (nowPage == null) {
			page = new Pagination(groupCounselDao.searchcountGroupCounsel(page), 1, 2); // 전체 수, start, end
		} else {
			page = new Pagination(groupCounselDao.searchcountGroupCounsel(page), Integer.parseInt(nowPage), 2); // 전체 수,
																												// start,
																												// end
		}

		page.setGc_title((String) session.getAttribute("gc_title"));
		page.setGc_date((String) session.getAttribute("gc_date"));
		page.setGc_startdate((String) session.getAttribute("gc_startdate"));
		page.setGc_finaldate((String) session.getAttribute("gc_finaldate"));
		page.setGc_type((String) session.getAttribute("gc_type"));
		page.setGc_status((String) session.getAttribute("gc_type"));

		List<GroupcounselVO> list = groupCounselDao.searchpageSelectList(page);

		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getGc_date();
			date = date.substring(0, 10);
			list.get(i).setGc_date(date);

			String date2 = list.get(i).getGc_startdate();
			date2 = date.substring(0, 10);
			list.get(i).setGc_date(date2);

			String date3 = list.get(i).getGc_finaldate();
			date = date.substring(0, 10);
			list.get(i).setGc_date(date3);

		}

		request.setAttribute("groupCounsel", list);
		request.setAttribute("page", page);

		return "counselor/groupcounselmanage/counselorGroupList";
	}

	@RequestMapping("/counselorGroupApply.do")
	public String counselorGroupApply(Model model, HttpServletRequest request, GroupcounselVO vo) {
		String c_email = request.getParameter("c_email");
		vo.setC_email(c_email);
		model.addAttribute("group", groupCounselDao.joinSelectList(vo));
		model.addAttribute("email", c_email);

		return "counselor/groupcounselmanage/counselorGroupApply";
	}

	@RequestMapping("/counselorGroupDetail.do")
	public String counselorGroupDetail(Model model, HttpServletRequest request, GroupcounselVO vo) {
		String gc_no = request.getParameter("gc_no");
		vo.setGc_no(gc_no);
		GroupcounselVO gvo = groupCounselDao.selectDetailList(vo);

		String date = gvo.getGc_date();
		date = date.substring(0, 10);
		gvo.setGc_date(date);

		String date2 = gvo.getGc_startdate();
		date2 = date.substring(0, 10);
		gvo.setGc_startdate(date2);

		String date3 = gvo.getGc_date();
		date3 = date3.substring(0, 10);
		gvo.setGc_finaldate(date3);

		model.addAttribute("detail", gvo);

		return "counselor/groupcounselmanage/counselorGroupDetail";
	}

	@RequestMapping("/selectFunc.do")
	@ResponseBody
	public GroupcounselVO selectFunc(Model model, HttpServletRequest request, GroupcounselVO vo) {
		String gr_no = request.getParameter("gr_no");
		GroupcounselVO gvo = groupCounselDao.selectgroupRserve(vo);
		return gvo;
	}

	@RequestMapping("/deleteFuncForm.do")
	@ResponseBody
	public String deleteForm() {
		return "성공";
	}

	@RequestMapping("/deleteFunc.do")
	@ResponseBody
	public String deleteFunc(Model model, HttpServletRequest request, GroupcounselVO vo, GroupcounselVO jvo) {
		return "모달 성공";
	}

	@RequestMapping("/upDateService.do")
	public String upDateService(HttpServletRequest request, GroupcounselVO vo, GroupcounselVO jvo, Model model) {
		String gr_no = request.getParameter("gr_no");
		String c_email = request.getParameter("c_email");
		String gr_refund = request.getParameter("gr_refund");

		vo.setGr_no(gr_no);
		vo.setGr_refund(gr_refund);
		groupCounselDao.GroupUserDelete(vo);
		jvo.setC_email(c_email);

		model.addAttribute("group", groupCounselDao.joinSelectList(jvo));
		model.addAttribute("email", c_email);

		return "counselor/groupcounselmanage/counselorGroupApply";
	}

	// 상담 관리 - 그룹상담 개설 화면
	@RequestMapping("/counselorGroupOpen.do")
	public String counselorGroupOpen(Model model) {
		return "counselor/groupcounselmanage/counselorGroupOpen";
	}

	@RequestMapping("/detailinsert.do")
	public String detailinsert(Model model, HttpServletRequest request, GroupcounselVO vo, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		String gc_no = request.getParameter("gc_no");
		String gc_report = request.getParameter("gc_report");
		String gc_result = request.getParameter("gc_result");
		if (gc_report == "" && gc_result == "") {
			out.println("<script>alert('상담 결과 등록 실패'); </script>");
			out.flush();
		} else {
			out.println("<script>alert('상담 결과 등록 성공'); </script>");
			out.flush();
		}
		vo.setGc_no(gc_no);
		GroupcounselVO gvo = groupCounselDao.selectDetailList(vo);

		String date = gvo.getGc_date();
		date = date.substring(0, 10);
		gvo.setGc_date(date);

		String date2 = gvo.getGc_startdate();
		date2 = date.substring(0, 10);
		gvo.setGc_startdate(date2);

		String date3 = gvo.getGc_date();
		date3 = date3.substring(0, 10);
		gvo.setGc_finaldate(date3);

		model.addAttribute("detail", gvo);

		vo.setGc_report(gc_report);
		vo.setGc_result(gc_result);
		groupCounselDao.groupCounselResult(vo);

		return "counselor/groupcounselmanage/counselorGroupDetail";
	}

	/* ===== 관리자 화면 ===== */

	@RequestMapping("/adminHome.do")
	public String adminMainPage() {
		return "admin/adminhome/adminHome";
	}

	@RequestMapping("/admintherapy.do")
	public String admintherapy(Model model) {
		List<TherapyVO> list = therapyDao.therapyList();
		model.addAttribute("therapy", list);

		return "admin/therapy/therapyList";
	}

	@RequestMapping("/therapyInsert.do")
	public String therapy() {

		return "admin/therapy/therapyInsert";
	}
}