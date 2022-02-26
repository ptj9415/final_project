package co.maeumi.prj.admin.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import co.maeumi.prj.admin.faq.service.FaqService;
import co.maeumi.prj.admin.faq.service.FaqVO;

@Controller
public class faqController {
	@Autowired
	private FaqService faqDao;

	// 은솔 관리자 FAQ

	// FAQ 목록
	@RequestMapping("/faqList.do")
	public String faqList(FaqVO vo, Model model) {
		List<FaqVO> list = faqDao.faqSelectList();

		// 날짜 뒤에 시간 자르고 년-월-일만
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getF_wdate();
			date = date.substring(0, 10);
			list.get(i).setF_wdate(date);
		}
			model.addAttribute("faqs", list);
			return "admin/faq/faqList";
	}

	
	// FAQ 상세 보기
	@RequestMapping("/faqRead.do")
	public String faqRead(FaqVO vo, Model model, HttpServletRequest request) {
		String no = request.getParameter("f_no");
		vo.setF_no(no);
		vo = faqDao.faqSelect(vo);
		model.addAttribute("faqRead",vo);
		return "admin/faq/faqRead";
	}
	
	
	// FAQ 작성
	@RequestMapping("/faqForm.do")
	public String FaqForm() {
		return "admin/faq/faqForm";
	}
	
	
	// FAQ 등록
	@RequestMapping("/faqResister.do")
	public String faqResister(FaqVO vo, HttpSession session) {
//		vo.setF_email((String) session.getAttribute("f_email"));
		vo.setF_email("luna@naver.com");
		faqDao.faqInsert(vo);
		System.out.println(vo.getF_title());
		return "redirect:faqList.do";
	}
	
	
	// FAQ 수정
	@RequestMapping("/faqUpdateForm.do")
	public String faqUpdateForm(FaqVO vo, Model model, HttpSession session) {
		model.addAttribute("faqSelect", faqDao.faqSelect(vo));
		return "admin/faq/faqUpdateForm";
	}

	
	// FAQ 수정 등록
	@RequestMapping("/faqUpdate.do")
	public String faqUpdate(FaqVO vo) {
		faqDao.faqUpdate(vo);
		return "redirect:faqList.do";
	}

	
	// FAQ 삭제
	@ResponseBody
	@RequestMapping("/faqDelete.do")
	public String faqDelete(Model model, FaqVO vo, HttpServletRequest request) {
		String f_no = request.getParameter("f_no");
		vo.setF_no(f_no);
		faqDao.faqDelete(vo);
		return "redirect:faqList.do";
	}

	
	// FAQ 검색
	@ResponseBody
	@RequestMapping("/faqSearch.do")
	public List<FaqVO> faqSearch(FaqVO vo, Model model) {
		List<FaqVO> list = faqDao.faqSearch(vo);
		for (int i = 0; i < list.size(); i++) {
			String date = list.get(i).getF_wdate();
			date = date.substring(0, 10);
			list.get(i).setF_wdate(date);
		}
		return list;
	}
}