package co.maeumi.prj.groupCounsel.web;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import co.maeumi.prj.groupCounsel.service.GroupCounslerService;
import co.maeumi.prj.groupCounsel.service.group_CounselVO;
import co.maeumi.prj.pagination.Pagination;

@Controller
public class groupCounselController {
	@Autowired
	private GroupCounslerService groupCounselDao;
	
	Pagination page;
	
	//이미지 보여주기 밑 이미지 업로드 아작스.
	@RequestMapping(value="/uploadSummernoteImageFile.do", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		//일반 파일 물리 경로
        //String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
        
		//경로 할 때 마다 계속 바꿔줘야함 아니면 절대 에디터 이미지 업로드 안됨.
        //Eclipse 파일 물리 경로 방식 (이클립스 내부에 저장)
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\editor\\";
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);
		File mtargetFile = new File(SAVE_PATH + savedFileName);
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			multipartFile.transferTo(mtargetFile); //다운로드 컨트롤러 만들고 뒤에 파일명 넣어주면 해당경로 파일을 다운로드해준다.
			jsonObject.addProperty("url", "/prj/resources/fileupload/"+savedFileName);
			// contextroot + resources + 저장할 내부 폴더명
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		System.out.println(a);
		return a;
	}
	
	@RequestMapping("/summernote.do")
	public String summernote(Model model, group_CounselVO vo, HttpServletResponse response,
							@RequestParam(value="filename") MultipartFile mf, HttpServletRequest req) throws IOException{
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		//vo값에 따라 성공 실패 여부 확인
		if(vo == null) {
			out.println("<script>alert('상담 페이지 개설 실패'); </script>");
			out.flush();
			return "counselor/counselormypage";
		}
		out.println("<script>alert('상담 페이지 개설 성공'); </script>");
		out.flush();
		
		//썸네일 파일업로드
		String SAVE_PATH = "C:\\final_project\\final_project\\src\\main\\webapp\\editorsumnail\\";
		String originalFileName = mf.getOriginalFilename();
		
		String uuid = UUID.randomUUID().toString();	//UUID를 통해서 물리파일명 만들기.
		String msaveFile = SAVE_PATH + uuid +originalFileName;  //원본 확장자명을 찾아서 붙여준다.
		String saveFile = uuid +originalFileName;
		vo.setGc_sumnail(saveFile);
		try {
            mf.transferTo(new File(msaveFile));
           } catch (IllegalStateException e) {
                e.printStackTrace();
           } catch (IOException e) {
                e.printStackTrace();
           }
		
		//서머노트 코드 원본
		String origincode = req.getParameter("summernote");
		System.out.println(origincode);
		//이미지 파일일 경우 코드 잘라서 쓰기.
		//홈페이지 구조상 이미지파일이 먼저 들어가야 되기 때문에 이렇게 만듬.
		if (origincode.contains("src=")) {
			String editedcode =  origincode.substring(0,origincode.indexOf("src=")+5) + "editor/" + origincode.substring(origincode.indexOf("src=")+31);
			System.out.println(editedcode);
			vo.setGc_infos(editedcode);
		}else {
			vo.setGc_infos(origincode);
		}
		groupCounselDao.insertGroupCounsel(vo);
		return "counselor/counselormypage";
	}
	
	// 상담 관리 - 그룹상담 관리 화면
	@RequestMapping("/groupcounselmanage.do")
	public String groupcounselmanage(Model model, HttpServletRequest request ) {

		String nowPage = request.getParameter("nowPage");
		if (nowPage==null) {
			page = new Pagination(groupCounselDao.countGroupCounsel(), 1, 2); //전체 수, start, end
		}else {
			page = new Pagination(groupCounselDao.countGroupCounsel(), Integer.parseInt(nowPage), 2); //전체 수, start, end
		}
		List<group_CounselVO> list =  groupCounselDao.pageSelectList(page);
		
		for (int i = 0; i < list.size(); i++) {
	         String date = list.get(i).getGc_date();
	         date = date.substring(0, 10);
	         list.get(i).setGc_date(date);
	         String date2 = list.get(i).getGc_startdate();
	         date = date.substring(0, 10);
	         list.get(i).setGc_date(date2);
	         String date3 = list.get(i).getGc_finaldate();
	         date = date.substring(0, 10);
	         list.get(i).setGc_date(date3);
	         
	      }
		request.setAttribute("groupCounsel", list);
		
		request.setAttribute("page", page);
		
		
		return "counselor/groupcounselmanage";	
	}
	@RequestMapping("/groupsearchmanage.do")
	public String groupsearchmanage(@RequestParam("gc_date") String gc_date,@RequestParam("gc_startdate") String gc_startdate,
			@RequestParam("gc_finaldate") String gc_finaldate, @RequestParam("gc_title") String gc_title,
			Model model, HttpServletRequest request ) {//@RequestParam("gc_type") String gc_type, @RequestParam("gc_status") String gc_status,
		if (gc_date == null && gc_startdate == null && gc_finaldate == null && gc_title == null) { //&& gc_type==null && gc_status == null
			String nowPage = request.getParameter("nowPage");
			if (nowPage==null) {
				page = new Pagination(groupCounselDao.countGroupCounsel(), 1, 2); //전체 수, start, end
			}else {
				page = new Pagination(groupCounselDao.countGroupCounsel(), Integer.parseInt(nowPage), 2); //전체 수, start, end
			}
			page.setGc_finaldate(gc_finaldate);
			page.setGc_startdate(gc_startdate);
			page.setGc_title(gc_title);
			page.setGc_date(gc_date);
			//page.setGc_type(gc_type);
			//page.setGc_status(gc_status);
			
			request.setAttribute("groupCounsel", groupCounselDao.pageSelectList(page));
			request.setAttribute("page", page);
				
		} else {
			String nowPage = request.getParameter("nowPage");
			page.setGc_title(gc_title);
			page.setGc_finaldate(gc_finaldate);
			page.setGc_startdate(gc_startdate);
			page.setGc_date(gc_date);
			//page.setGc_type(gc_type);
			//page.setGc_status(gc_status);
			if (nowPage==null) {
				page = new Pagination(groupCounselDao.searchcountGroupCounsel(page), 1, 2); //전체 수, start, end
			}else {
				page = new Pagination(groupCounselDao.searchcountGroupCounsel(page), Integer.parseInt(nowPage), 2); //전체 수, start, end
			}
			System.out.println(groupCounselDao.searchcountGroupCounsel(page));
			page.setGc_title(gc_title);
			page.setGc_finaldate(gc_finaldate);
			page.setGc_startdate(gc_startdate);
			page.setGc_date(gc_date);
			//page.setGc_type(gc_type);
			//page.setGc_status(gc_status);
			
			request.setAttribute("groupCounsel", groupCounselDao.searchpageSelectList(page));
			request.setAttribute("page", page);
		}
			
		return "counselor/groupcounselmanage";	
	}
	
}
