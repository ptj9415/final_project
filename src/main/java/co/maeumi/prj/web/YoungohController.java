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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import co.maeumi.prj.board.service.BoardService;
import co.maeumi.prj.board.service.BoardVO;
import co.maeumi.prj.boardReply.service.BoardReplyService;
import co.maeumi.prj.boardReply.service.BoardReplyVO;
import co.maeumi.prj.coupon.service.CouponService;
import co.maeumi.prj.coupon.service.CouponVO;
import co.maeumi.prj.groupcounsel.service.GroupcounselService;
import co.maeumi.prj.groupcounsel.service.GroupcounselVO;
import co.maeumi.prj.member.service.MemberService;
import co.maeumi.prj.member.service.MemberVO;
import co.maeumi.prj.mypage.service.myPageService;
import co.maeumi.prj.mypage.service.myPageVO;
import co.maeumi.prj.order.service.orderService;
import co.maeumi.prj.order.service.order_datailVO;
import co.maeumi.prj.service.Aes256;
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
	
	@Autowired
	private CouponService couponDao;
	
	@Autowired
	Aes256 aes256;
	
	@Autowired
	private myPageService myPageDao;
	
	@Autowired
	private MemberService memberDao;
	
	@Autowired
	private BoardService boardDao;
	
	@Autowired
	private BoardReplyService boardreplyDao;

	Pagination page;
	/* ===== 상담사 화면 ===== */
	
	// 상담 관리 - 그룹상담 개설 화면
	@RequestMapping("/counselorGroupOpen.do")
	public String counselorGroupOpen(Model model) {
		return "counselor/groupcounselmanage/counselorGroupOpen";
	}
	
	//상담사 개설 페이지 이미지 업로드 아작스.
	@RequestMapping(value = "/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile,
			HttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		// 일반 파일 물리 경로
		// String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.

		// 경로 할 때 마다 계속 바꿔줘야함 아니면 절대 에디터 이미지 업로드 안됨.
		// Eclipse 파일 물리 경로 방식 (이클립스 내부에 저장)
		//String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\editor\\";
		String SAVE_PATH = request.getServletContext().getRealPath("editor/");
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

	//상담사 개설 페이지 insert 구문
	@RequestMapping("/summernote.do")
	public String summernote(Model model, GroupcounselVO vo, HttpServletResponse response,HttpServletRequest request,
			@RequestParam(value = "filename") MultipartFile mf, HttpServletRequest req) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();


		// 썸네일 파일업로드
		//String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\editorsumnail\\";
		String SAVE_PATH = request.getServletContext().getRealPath("editor/");
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
	
	//상담사 관리 페이지 메인화면
	@RequestMapping("/counselorGroupList1.do")
	public String counselorGroupList1(Model model, HttpServletRequest request) {
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
	
	//상담사 관리 페이지 신청자 관리 페이지
	@RequestMapping("/counselorGroupApply.do")
	public String counselorGroupApply(Model model, HttpServletRequest request, GroupcounselVO vo) {
		String c_email = request.getParameter("c_email");
		vo.setC_email(c_email);
		model.addAttribute("group", groupCounselDao.joinSelectList(vo));
		model.addAttribute("email", c_email);

		return "counselor/groupcounselmanage/counselorGroupApply";
	}
	
	//상담사 관리 페이지 상세 목록 페이지
	@RequestMapping("/counselorGroupDetail.do")
	public String counselorGroupDetail(Model model, HttpServletRequest request, GroupcounselVO vo) throws Exception {
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
		
		System.out.println(gvo.getGc_report());
		String result = aes256.decrypt(gvo.getGc_report());
		gvo.setGc_report(result);
		

		model.addAttribute("detail", gvo);

		return "counselor/groupcounselmanage/counselorGroupDetail";
	}
	
	//이거는 합칠 때 필요합니다.!!!!
	//그룹 상담 신청자 목록 페이지 삭제 페이지입니다.
	@RequestMapping("/upDateService.do")
	@ResponseBody
	public String upDateService(HttpServletRequest request, GroupcounselVO vo) {
		System.out.println("왜 안오냐?");
		String gr_no = request.getParameter("gr_no");
		vo.setGr_no(gr_no);
		System.out.println("여기로 오나요?");
		groupCounselDao.GroupUserDelete(vo);
		return null;
	}

	//그룹 상담 상세 페이지 상담 결과 등록 처리. 
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
	
	// 심리 테라피 등록 이미지 처리 아작스 입니다.
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
		System.out.println("jpg로 들어오나요 : "+extension);
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

	// 테라피 등록 페이지 입니다.
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
	
	//심리 테라피 등록 폼 페이지입니다.
	@RequestMapping("/therapyInsertForm.do")
	public String therapyInsertForm() {
		return "admin/therapy/therapyInsert";
	}

	//심리 테라피 수정 페이지 폼 입니다.
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

		// 썸네일 파일업로드
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\therapysumnail\\";
		String originalFileName = mf.getOriginalFilename();
		
		System.out.println(originalFileName);
		if (originalFileName == "") {
			return "redirect:admintherapy.do";
		}
			System.out.println("일로 들어감.");
		String uuid = UUID.randomUUID().toString(); // UUID를 통해서 물리파일명 만들기.
		String msaveFile = SAVE_PATH + uuid + originalFileName; // 원본 확장자명을 찾아서 붙여준다.
		String saveFile = uuid + originalFileName;

		try {
			vo.setT_picture(saveFile);
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
	public String userGroup(GroupcounselVO vo, Model model, HttpServletRequest request ) {
		GroupcounselVO gvo = groupCounselDao.selectUserGroup(vo);
		String date = gvo.getGc_date();
		date = date.substring(0, 10);
		gvo.setGc_date(date);
		String c_email = request.getParameter("c_email");
		System.out.println(c_email);
		model.addAttribute("c_email",c_email);
		model.addAttribute("userGroup", gvo);
		return "user/groupcounsel/userGroup";
	}

	//그룹 상담 유저 invoice 페이지입니다.
	//유저 이메일 세션값이 들어가야 됩니다.
	@RequestMapping("/usergroupinvoice.do")
	public String usergroupinvoice(GroupcounselVO vo, Model model, HttpServletRequest request, CouponVO cvo) {
		String c_email = request.getParameter("c_email");
		String gc_no = request.getParameter("gc_no");
		System.out.println(gc_no);
		GroupcounselVO gvo = groupCounselDao.selectInvoice(vo);
		gvo.setM_email("이메일 성공");
		cvo.setM_email("gnjqtpfl@naver.com");    //이메일 세션 값이 들어가야됨.
		List<CouponVO> cplist = couponDao.couponMemberSelectList(cvo);
		model.addAttribute("groupInvoice", gvo);
		model.addAttribute("coupon", cplist);
		model.addAttribute("c_email", c_email);
		return "user/groupcounsel/groupInvoice";
	}
	
	//그룹 상담 유저 결제 완료 페이지입니다.
	@RequestMapping("/payment.do")
	public String payment(GroupcounselVO vo, Model model, order_datailVO ovo, CouponVO cvo, HttpServletRequest request) {
		groupCounselDao.groupReserveInsert(vo);  //그룹 상담 예약 등록하기.
		String c_email = request.getParameter("c_email");
		System.out.println(c_email);
		ovo.setGc_no(vo.getGc_no());
		ovo.setOr_price(vo.getGr_price());
		ovo.setC_email(c_email);
		int orderInsert = orderDao.orderInsert(ovo); //주문 상세 내역 등록 메소드.
		if (orderInsert == 1) {
			int num = orderDao.MaxGroupOrder();  //insert 후 주문 상세 넘버값 찾아주기.
			System.out.println(num);
			ovo.setOr_no(num);
			ovo = orderDao.selectorderList(ovo);  //그룹 상담 결과 셀렉트 메소드
			System.out.println(ovo.getOr_date());
			groupCounselDao.groupUpdatePerson(vo); //인원수 증가 메소드
		
			//couponDao.couponDelete(cvo);        //쿠폰 삭제 메소드
			
			String date = ovo.getGc_date();
			date = date.substring(0, 10);
			ovo.setGc_date(date);
			
			model.addAttribute("result", ovo);
		}
		return "user/groupcounsel/groupResult";
	}
	
	//심리 테라피 유저 페이지 폼 입니다.
	@RequestMapping("/userTerapy.do")
	public String userTerapy(Model model, HttpServletRequest request) {
		String nowPage = request.getParameter("nowPage");
		if (nowPage == null) {
			page = new Pagination(therapyDao.selectTherapyCount(), 1, 8); // 전체 수, 첫 번째 페이지, 한 페이지당 개수
		} else {
			page = new Pagination(therapyDao.selectTherapyCount(), Integer.parseInt(nowPage), 8); // 전체 수, nowPage, 한 페이지 당 개수
		}
		List<TherapyVO> list = therapyDao.therapyLists(page);
		model.addAttribute("therapylist", list);
		model.addAttribute("page", page);
		return "user/therapy/therapyList";
	}
	
	//심리 테라피 디테일 페이지 입니다.
	@RequestMapping("/therapyDetail.do")
	public String therapyDetail(TherapyVO vo, Model model) {
		TherapyVO gvo = therapyDao.selectTherapyDetail(vo);
		model.addAttribute("selectTherapy", gvo);
		return "user/therapy/therapyDetail";
	}
	
	//심리검사 이동 페이지.
	@RequestMapping("/simri.do")
	public String simri() {
		return "user/test/simri";
	}
	
	//유저 마이페이지 관리.
	@RequestMapping("/userMypages.do")
	public String userMypages(HttpServletRequest request, HttpSession session ,MemberVO mvo, Model model, myPageVO vo, BoardVO bvo) {
		
		mvo.setM_email( (String) session.getAttribute("email") );
		mvo.setM_type( (String) session.getAttribute("type"));
		
		vo.setM_email( (String) session.getAttribute("email") );
		bvo.setB_email((String) session.getAttribute("email") );
		List<myPageVO> list = myPageDao.selectOrder(vo);
		System.out.println("세션값 이메일 담겼는지 확인: " + mvo.getM_email());
		System.out.println("세션값 가입유형 담겼는지 확인: " + mvo.getM_type());
		
		List<BoardVO> blist = myPageDao.selectBoard(bvo);
		for (int i = 0; i < blist.size(); i++) {
			String date = blist.get(i).getB_wdate();
			date = date.substring(0, 10);
			blist.get(i).setB_wdate(date);
		}
		
		List<myPageVO> plist = myPageDao.selectPersonal(vo);
		for (int i = 0; i < plist.size(); i++) {
			String date = plist.get(i).getPr_date();
			date = date.substring(0, 10);
			plist.get(i).setPr_date(date);
		}
		
		List<myPageVO> glist = myPageDao.selectGroup(vo);
		for (int i = 0; i < glist.size(); i++) {
			String date = glist.get(i).getGr_reservedate();
			date = date.substring(0, 10);
			glist.get(i).setGr_reservedate(date);
		}
		
		
		model.addAttribute("member", memberDao.mypageSelectList(mvo));
		model.addAttribute("list",list);
		model.addAttribute("blist", blist);
		model.addAttribute("plist",plist);
		model.addAttribute("glist",glist);
		System.out.println("전달되는 얘의 값이 뭘까? : " + memberDao.mypageSelectList(mvo));
		return "user/mypage/mypageMain";
	}
	//마이페이지 유저 환불
	@RequestMapping("/mypageRefund.do")
	public String mypageRefund(HttpServletRequest request, myPageVO vo) {
		String or_no = request.getParameter("or_no");
		int num = Integer.parseInt(or_no);
		vo.setOr_no(num);
		vo = myPageDao.findNo(vo);
		vo.setOr_no(num);
		System.out.println(vo.getPr_no());
		System.out.println(vo.getGc_no());
		int success = myPageDao.myPageRefund(vo);
		if (success == 1) {
			//그룹 상담일 경우
			if (vo.getPr_no() == 0) {
				System.out.println("그룹 상담으로 들어옴");
				myPageDao.myPageGroupRefund(vo);
			}
			//개인 상담일 경우
			if (vo.getGc_no() == 0) {
				System.out.println("개인 상담으로 들어옴");
				myPageDao.myPagePersonalRefund(vo);
			}
		}
		return "redirect:userMypages.do";
	}
	//마이페이지 유저 자유게시글 디테일 페이지
	@RequestMapping("/myPageboardDetail.do")
	public String myPageboardDetail(HttpServletRequest request,BoardVO vo,Model model, BoardReplyVO bvo) {
		String b_no = request.getParameter("b_no");
		int num = Integer.parseInt(b_no);
		vo.setB_no(num);
		
		vo =  myPageDao.boardDetail(vo);
		String date = vo.getB_wdate();
		date = date.substring(0, 10);
		vo.setB_wdate(date);

		model.addAttribute("board",vo);

		List<BoardReplyVO> blist = myPageDao.boardReplyDetail(bvo);
		for (int i = 0; i < blist.size(); i++) {
			String brdate = blist.get(i).getBr_wdate();
			brdate = brdate.substring(0, 10);
			blist.get(i).setBr_wdate(brdate);
		}
		
		model.addAttribute("brboard", blist);
		
		return "user/mypage/mypageBoard";
	}
	//유저 마이페이지 개인 상담 디테일 페이지
	@RequestMapping("/userPersonalsangDam.do")
	public String userPersonalsangDam(HttpServletRequest request, myPageVO vo, Model model ) {
		String pr_no = request.getParameter("pr_no");
		int num = Integer.parseInt(pr_no);
		vo.setPr_no(num);
		vo = myPageDao.mypagePersonal(vo);
		model.addAttribute("personal",vo);
		return "user/mypage/mypagePersonalDetail"; 
	}
	//유저 마이페이지 그룹 상담 디테일 페이지
	@RequestMapping("/userGroupsangDam.do")
	public String userGroupsangDam(HttpServletRequest request, myPageVO vo, Model model) {
		String gc_no = request.getParameter("gc_no");
		int num = Integer.parseInt(gc_no);
		vo.setGc_no(num);
		vo = myPageDao.mypageGroup(vo);
		
		String date = vo.getGc_date();
		date = date.substring(0, 10);
		vo.setGc_date(date);
		String date2 = vo.getGc_startdate();
		date2 = date2.substring(0, 10);
		vo.setGc_startdate(date2);
		String date3 = vo.getGc_finaldate();
		date3 = date3.substring(0, 10);
		vo.setGc_finaldate(date3);
		
		model.addAttribute("glist", vo);
		return "user/mypage/mypageGroupDetail"; 
	}
	//그룹 상담 수정 필요해서 최종적으로 수정했습니다. 2022/03/16
	@RequestMapping("/groupCounselUpdates.do")
	public String groupCounselUpdate(Model model, GroupcounselVO vo, HttpServletResponse response,
		@RequestParam(value = "filename") MultipartFile mf, HttpServletRequest req) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();

		// 썸네일 파일업로드
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\editorsumnail\\";
		String originalFileName = mf.getOriginalFilename();
			System.out.println(originalFileName);
		if (originalFileName !="") {
			System.out.println("널값 아님");
			
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
		}else {
			System.out.println("널 값");
			vo.setGc_sumnail("");
		}
		
		String origincode = req.getParameter("summernote");
		String result = origincode.replaceAll(req.getContextPath() + "/resources/fileupload/", "editor/");
		vo.setGc_infos(result);

		int update = groupCounselDao.groupCounselUpdate(vo);

		// vo값에 따라 성공 실패 여부 확인
		if (update != 1) {
			out.println("<script>alert('상담 페이지 수정 실패'); history.back(); </script>");
			out.flush();
		} else {
			out.println("<script>alert('상담 페이지 수정 성공'); location.href='counselorGroupList.do'</script>");
			out.flush();
		}
		return null;
	}
	// 마이페이지 자유 게시글 삭제
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo, HttpServletRequest request, BoardReplyVO bvo) {
		 String b_no = request.getParameter("b_no");
		 System.out.println(b_no);
		 int num = Integer.parseInt(b_no);
		
		 vo.setB_no(num);
		 int n = boardDao.boardDelete(vo);
		 System.out.println(n);
		 if (n == 1) {
			 bvo.setB_no(num);
			int d = boardreplyDao.boardReplyDelete(bvo);
			System.out.println(d);
		 }
		 
		return "redirect:userMypages.do";
	}
	// 마이페이지 그룹 상담 환불 버튼
	@RequestMapping("/mypageGroupDetailRefund.do")
	public String mypageGroupDetailRefund(HttpServletRequest request, myPageVO vo, Model model) {
		String gc_no = request.getParameter("gc_no");
		int num = Integer.parseInt(gc_no);
		vo.setGc_no(num);
		vo = myPageDao.mypageGroup(vo);
		
		vo = myPageDao.GroupdetailRefund(vo);
		System.out.println(vo.getOr_no());
		System.out.println(vo.getGr_no());
		
		return "redirect:userMypages.do";
	}
	
	
	
}
