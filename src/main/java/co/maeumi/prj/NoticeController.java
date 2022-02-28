package co.maeumi.prj;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.maeumi.prj.notice.service.NoticeService;
import co.maeumi.prj.notice.service.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeDao;
	
	
	@RequestMapping("/noticeMain.do")
	public String noticeMain(HttpSession session, HttpServletRequest request, Model model) {
		
		model.addAttribute("notices", noticeDao.noticeSelectList()); // 게시글 전체 가져오는지 조회. 
		
		
		return "admin/noticeMain";
	}
	
	@RequestMapping("/noticeForm.do")
	public String noticeWrite(Model model, HttpServletRequest request, HttpSession session ) {
		
		return "admin/noticeForm";
	}
	
	
	// ckupload 
	@RequestMapping("/imageUpload.do")
	public void imageUpload(HttpServletRequest request, HttpServletResponse response
				, @RequestParam MultipartFile upload) // view단에서 업로드한 파일이 'upload'에 담기게 된다.
				throws Exception {
		 	
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		OutputStream out  = null;
		PrintWriter printWriter = null;
		String fileName = upload.getOriginalFilename();   // 업로드한 파일 이름
		byte[] bytes = upload.getBytes();  // 파일을 바이트 배열로 만든다. 
		ServletContext application = request.getSession().getServletContext(); 
		String uploadPath = application.getRealPath("/resources/ckUpload");  // 업로드 될 공간.
		out = new FileOutputStream(new File(uploadPath + fileName)); 
		out.write(bytes);	// 배포 경로에 파일이 저장된다. 
		printWriter = response.getWriter();	// 웹브라우저에 출력해주기 위한 객체. 
		String fileUrl = request.getContextPath() + "/images/" + fileName;
		printWriter.println("{\"filename\":\"" + fileName + "\",\"uploaded\":1,\"url\":\"" + fileUrl + "\"}");
		printWriter.flush();
	}
	
	@RequestMapping("/noticeRegister.do")
	public String noticeRegister(Model model, NoticeVO vo, HttpServletRequest request, HttpServletResponse response) {
		
		// 파라미터값 넘어왔는지 확인. 이 값들을 테이블에 집어넣을 생각.
		System.out.println("title은 " + request.getParameter("title"));
		System.out.println("말머리 : " + request.getParameter("category"));
		System.out.println("내용 : " + request.getParameter("content"));
		System.out.println("첨부파일: " + request.getParameter("fileName"));
		System.out.println("작성자: " + request.getParameter("writer"));
		System.out.println("작성일: " + request.getParameter("wdate"));
		
		//insert구문. 첨부파일 있으면 첨부파일도.
		vo.setN_writer(request.getParameter("writer"));
		vo.setN_title(request.getParameter("title"));
		vo.setN_content(request.getParameter("content"));
		vo.setN_filename(request.getParameter("fileName"));
		vo.setN_category(request.getParameter("category"));
		vo.setN_writedate(request.getParameter("wdate"));
		vo.setN_pfilename(request.getParameter("pfileName"));
		vo.setN_writedate(request.getParameter("wdate"));
		
		//값 넣기.
		noticeDao.noticeInsert(vo);
		
		return "redirect:noticeMain.do";
	}
	
	
//	@ResponseBody
//	@RequestMapping("/noticeDelete.do")
//	public String noticeDelete(HttpServletRequest request, Model model, NoticeVO vo) {
//		
//		System.out.println("넘어온 값: " + request.getParameter("deleteNum"));
//		
//		vo.setN_no(request.getParameter("deleteNum"));
//		int n  =noticeDao.noticeDelete(vo);
//		String responseText = null;
//		
//		if(n !=0) {
//			responseText = "YES";
//			System.out.println("성공~~");
//		} else {
//			System.out.println("실패");
//		}
//		
//		return responseText;
//		
//	}
	
	
	
	
	
	
	
}
