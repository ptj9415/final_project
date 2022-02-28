package co.maeumi.prj.faq.service;

import java.util.List;

public interface FaqService {
	List<FaqVO> faqSelectList();
	FaqVO faqSelect(FaqVO vo);
	int faqInsert(FaqVO vo);
	int faqUpdate(FaqVO vo);
	int faqDelete(FaqVO vo);
	List<FaqVO> faqSearch(FaqVO vo); // 검색
}
