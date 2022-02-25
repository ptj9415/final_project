package co.maeumi.prj;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;

@Controller
public class CounselorController {
	@Autowired
	private CounselorService counselorDao;
	
	// 상담 관리 - 개인상담 신청내역 화면
	@RequestMapping("/personalcounsel.do")
	public String personalcounsel(Model model) {
		return "counselor/myintro";
	}
	
	// 상담 관리 - 그룹상담 개설 화면
	@RequestMapping("/groupcounselopen.do")
	public String groupcounselopen(Model model) {
		return "counselor/groupcounselopen";
	}
  
	@RequestMapping("/counselormypage.do")
	public String adminhome(Model model, CounselorVO cvo, HttpSession session) {
//			String c_email = (String)session.getAttribute("email");
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
		
		return "counselor/counselormypage";
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
	
	//다중파일 업로드 예제 
	@ResponseBody
	@RequestMapping(value = "/fileupload.do", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				
				for(MultipartFile file:multipartFile) {
					String fileRoot = "C:\\Users\\admin\\git\\final_project\\src\\main\\webapp\\evidence\\";
					System.out.println(fileRoot);
					
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일 아무것도 첨부 안했을때 탄다.(게시판일때, 업로드 없이 글을 등록하는경우)
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}

	// 상담사 마이페이지 - 내 정보 수정 / 상담사 등급 변경 신청 화면
	@RequestMapping("/counselorinfo.do")
	public String counselorinfo(Model model, CounselorVO cvo) {
		
		cvo.setC_email("3244509@naver.com");		
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));
		return "counselor/counselorinfo";
	}

	// 상담사 마이페이지 - 상담 경력 수정 화면
	@RequestMapping("/mycareer.do")
	public String mycareer(Model model, CounselorVO cvo) {
		String c_email = "3244509@naver.com";
		cvo.setC_email(c_email);
		List<CounselorVO> list = counselorDao.counselorCareerList(cvo);
		model.addAttribute("career", list);
		model.addAttribute("counselor", counselorDao.counselorSelect(cvo));
		return "counselor/mycareer";
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
	@RequestMapping("/mycertification.do")
	public String mycertification(Model model, CounselorVO cvo) {
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

		return "counselor/mycertification";
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
	@RequestMapping("/mycounseltime.do")
	public String mycounseltime(Model model, CounselorVO cvo) {
		cvo.setC_email("3244509@naver.com");
		List<CounselorVO> list = counselorDao.counselortimeList(cvo);
		
		model.addAttribute("time", list);
		
		return "counselor/mycounseltime";
	}
	
	//상담사 마이페이지 - 상담시간 수정
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
	@RequestMapping("/myintro.do")
	public String myintro(Model model, CounselorVO cvo) {
		cvo.setC_email("3244509@naver.com");		
		model.addAttribute("info", counselorDao.counselorinfoList(cvo));
		
		return "counselor/myintro";
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
	
	@RequestMapping("/cTermsCheck.do")
	public String cTermsCheck(Model model) {
		return "user/cTermsCheck";
	}
	@RequestMapping("/cEmailCheck.do")
	public String cEmailCheck(Model model) {
		return "user/cEmailCheck";
	}
	@RequestMapping("/counselorJoinForm.do")
		public String counselorJoinForm(Model model, HttpServletRequest request) {
			model.addAttribute("c_email", request.getParameter("inputEmail"));
			return "user/counselorJoinForm";
	}
	
	
}
	
	
	
	
	

