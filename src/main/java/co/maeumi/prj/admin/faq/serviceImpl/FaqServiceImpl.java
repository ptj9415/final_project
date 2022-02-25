package co.maeumi.prj.admin.faq.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.admin.faq.service.FaqMapper;
import co.maeumi.prj.admin.faq.service.FaqService;
import co.maeumi.prj.admin.faq.service.FaqVO;

@Repository("faqDao")
public class FaqServiceImpl implements FaqService {
	
	@Autowired
	private FaqMapper map;
	
	@Override
	public List<FaqVO> faqSelectList() {
		return map.faqSelectList();
	}

	@Override
	public FaqVO faqSelect(FaqVO vo) {
		return map.faqSelect(vo);
	}

	@Override
	public int faqInsert(FaqVO vo) {
		return map.faqInsert(vo);
	}

	@Override
	public int faqUpdate(FaqVO vo) {
		return map.faqUpdate(vo);
	}

	@Override
	public int faqDelete(FaqVO vo) {
		return map.faqDelete(vo);
	}

	@Override
	public List<FaqVO> faqSearch(FaqVO vo) {
		return map.faqSearch(vo);
	}

}