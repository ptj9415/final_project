package co.maeumi.prj.faq.service;

import java.util.List;

import co.maeumi.prj.service.Search;

public interface FaqService {
	List<FaqVO> faqSelectList();
	FaqVO faqSelect(FaqVO vo);
	int faqInsert(FaqVO vo);
	int faqUpdate(FaqVO vo);
	int faqDelete(FaqVO vo);
	List<FaqVO> faqSearch(FaqVO vo); // 검색
	
	// 검색 & 페이징
	int getFaqListCnt(Search svo) throws Exception;
	public List<FaqVO> FaqSearchselect(Search svo) throws Exception;
}
