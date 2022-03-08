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
import org.apache.tiles.request.Request;
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
import co.maeumi.prj.order.service.orderService;
import co.maeumi.prj.order.service.order_datailVO;
import co.maeumi.prj.service.Pagination;
import co.maeumi.prj.therapy.service.TherapyService;
import co.maeumi.prj.therapy.service.TherapyVO;

@Controller
public class YoungohController {

	@Autowired
	private GroupcounselService groupCounselDao;

	@Autowired
	private TherapyService therapyDao;

	@Autowired
	private orderService orderDao;

	Pagination page;
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
			jsonObject.addProperty("url", request.getContextPath() + "/resources/fileupload/" + savedFileName);
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
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();


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
		// 이미지 파일일 경우 코드 잘라서 쓰기.
		// 홈페이지 구조상 이미지파일이 먼저 들어가야 되기 때문에 이렇게 만듬.

		String origincode = req.getParameter("summernote");
		String result = origincode.replaceAll(req.getContextPath() + "/resources/fileupload/", "editor/");
		vo.setGc_infos(result);

		int insert = groupCounselDao.insertGroupCounsel(vo);
		
		// vo값에 따라 성공 실패 여부 확인
		if (insert != 1) {
			out.println("<script>alert('상담 페이지 개설 실패'); history.back(); </script>");
			out.flush();
		}else {
			out.println("<script>alert('상담 페이지 개설 성공'); location.href='counselorGroupList.do'</script>");
			out.flush();
		}
		return null;
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
		int gc_nos = Integer.parseInt(gc_no);
		vo.setGc_no(gc_nos);
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

	// 그룹 상담 상세 페이지 조회 모달창 띄우기 아작스입니다.
	@RequestMapping("/selectFunc.do")
	@ResponseBody
	public GroupcounselVO selectFunc(Model model, HttpServletRequest request, GroupcounselVO vo) {
		GroupcounselVO gvo = groupCounselDao.selectgroupRserve(vo);
		return gvo;
	}

	@RequestMapping("/deleteFuncForm.do")
	@ResponseBody
	public String deleteForm() {
		return "성공";
	}

	// 그룹 상담 상세 페이지 삭제 모달창 띄우기 아작스 입니다.
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

	//상담 결과 등록 처리 
	@RequestMapping("/detailinsert.do")
	public String detailinsert(Model model, HttpServletRequest request, GroupcounselVO vo, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (vo.getGc_report() == "" && vo.getGc_result() == "") {
			out.println("<script>alert('상담 결과 등록 실패'); </script>");
			out.flush();
		} else {
			out.println("<script>alert('상담 결과 등록 성공'); </script>");
			out.flush();
			groupCounselDao.groupCounselResult(vo);
		}

		return "redirect:counselorGroupList.do";
	}

	/* ===== 관리자 화면 ===== */
	// 관리자 메인 화면입니다.
	@RequestMapping("/adminHome.do")
	public String adminMainPage() {
		return "admin/adminhome/adminHome";
	}

	// 테라피 관리 페이지 입니다.
	@RequestMapping("/admintherapy.do")
	public String admintherapy(Model model) {
		List<TherapyVO> list = therapyDao.therapyList();
		model.addAttribute("therapy", list);

		return "admin/therapy/therapyList";
	}

	// 써머노트 이미지 파일 띄우기 및 물리경로 다운로드 아작스 입니다.
	@RequestMapping(value = "/uploadSummernoteImageFileList.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFileList(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		// 일반 파일 물리 경로
		// String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.

		// 경로 할 때 마다 계속 바꿔줘야함 아니면 절대 에디터 이미지 업로드 안됨.
		// Eclipse 파일 물리 경로 방식 (이클립스 내부에 저장)
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\therapyEditor\\";

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
			jsonObject.addProperty("url", request.getContextPath() + "/resources/fileupload/" + savedFileName);
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

	// 테라피 등록입니다.
	@RequestMapping("/therapyInsert.do")
	public String therapy(Model model, TherapyVO vo, HttpServletResponse response,
			@RequestParam(value = "filename") MultipartFile mf, HttpServletRequest req) {

		// 썸네일 파일업로드
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\therapysumnail\\";
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID를 통해서 물리파일명 만들기.
		String msaveFile = SAVE_PATH + uuid + originalFileName; // 원본 확장자명을 찾아서 붙여준다.
		String saveFile = uuid + originalFileName;
		vo.setT_picture(saveFile);

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

		String result = origincode.replaceAll(req.getContextPath() + "/resources/fileupload/", "therapyEditor/");
		System.out.println(result);
		vo.setT_subject(result);
		therapyDao.InsertTherapy(vo);
		return "redirect:/admintherapy.do";
	}

	@RequestMapping("/therapyInsertForm.do")
	public String therapyInsertForm() {
		return "admin/therapy/therapyInsert";
	}

	@RequestMapping("/therapyUpdateForm.do")
	public String therapyUpdate(TherapyVO vo, HttpServletRequest request, Model model) {
		String req = request.getParameter("t_no");
		int t_no = Integer.parseInt(req);
		vo.setT_no(t_no);

		TherapyVO tvo = therapyDao.selectTherapy(vo);
		model.addAttribute("therapy", tvo);
		return "admin/therapy/therapyUpdate";
	}

	// 테라피 업데이트 입니다.
	@RequestMapping("/therapyUpdate.do")
	public String therapyUpdate(Model model, TherapyVO vo, @RequestParam(value = "filename") MultipartFile mf,
			HttpServletRequest request) {
		String t_no = request.getParameter("t_no");
		int t_nos = Integer.parseInt(t_no);
		vo.setT_no(t_nos);

		// 썸네일 파일업로드
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\therapysumnail\\";
		String originalFileName = mf.getOriginalFilename();

		String uuid = UUID.randomUUID().toString(); // UUID를 통해서 물리파일명 만들기.
		String msaveFile = SAVE_PATH + uuid + originalFileName; // 원본 확장자명을 찾아서 붙여준다.
		String saveFile = uuid + originalFileName;
		vo.setT_picture(saveFile);

		try {
			mf.transferTo(new File(msaveFile));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		String origincode = request.getParameter("summernote");
		String result = origincode.replaceAll(request.getContextPath() + "/resources/fileupload/", "therapyEditor/");
		vo.setT_subject(result);

		therapyDao.UpdateTherapy(vo);

		return "redirect:admintherapy.do";
	}

	// 테라피 삭제 아작스 입니다.
	@RequestMapping("/therapyDelete.do")
	@ResponseBody
	public String therapyDelete(HttpServletRequest request, TherapyVO vo, Model model) {

		String t_no = request.getParameter("t_no");
		System.out.println(t_no);
		int t_nos = Integer.parseInt(t_no);
		vo.setT_no(t_nos);

		List<TherapyVO> list = therapyDao.therapyList();

		therapyDao.DeleteTherapy(vo);
		return "Ok";
	}

	// 그룹 상담 유저 페이지 시작입니다.
	@RequestMapping("/userGroupCounsel.do")
	public String userGroupCounsel(Model model) {
		List<GroupcounselVO> list = groupCounselDao.groupSelectList();
		model.addAttribute("groupCounselList", list);
		return "user/groupcounsel/groupCounselApplication";
	}

	// 그룹 상담 유저 상세 페이지입니다.
	@RequestMapping("/userGroup.do")
	public String userGroup(GroupcounselVO vo, Model model) {
		System.out.println(vo.getGc_no());
		GroupcounselVO gvo = groupCounselDao.selectUserGroup(vo);
		model.addAttribute("userGroup", gvo);
		return "user/groupcounsel/userGroup";
	}

	@RequestMapping("/usergroupinvoice.do")
	public String usergroupinvoice(GroupcounselVO vo, Model model, HttpServletRequest request) {
		String gc_no = request.getParameter("gc_no");
		System.out.println(gc_no);
		GroupcounselVO gvo = groupCounselDao.selectInvoice(vo);
		gvo.setM_email("이메일 성공");
		model.addAttribute("groupInvoice", gvo);
		return "user/groupcounsel/groupInvoice";
	}

	@RequestMapping("/payment.do")
	public String payment(GroupcounselVO vo, Model model, order_datailVO ovo) {
		groupCounselDao.groupReserveInsert(vo); 
		ovo.setGc_no(vo.getGc_no());
		ovo.setOr_price(vo.getGr_price());
		int orderInsert = orderDao.orderInsert(ovo);
		if (orderInsert == 1) {
			order_datailVO gvo = orderDao.selectorderList(ovo);
			model.addAttribute("result", gvo);
		}
		return "user/groupcounsel/groupResult";
	}
	
	@RequestMapping("/usertest.do")
	public String usertest() {
		return "user/groupcounsel/usertest";
	}
}
