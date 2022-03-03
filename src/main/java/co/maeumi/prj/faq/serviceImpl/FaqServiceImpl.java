package co.maeumi.prj.faq.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.faq.service.FaqMapper;
import co.maeumi.prj.faq.service.FaqService;
import co.maeumi.prj.faq.service.FaqVO;
import co.maeumi.prj.service.Search;

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

	@Override
	public List<FaqVO> FaqSearchSelect(Search svo) throws Exception {
		return map.FaqSearchSelect(svo);
	}
	
	@Override
	public int getFaqListCnt(Search svo) throws Exception {
		return map.getFaqListCnt(svo);
	}


}
