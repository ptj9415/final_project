package co.maeumi.prj.admin.faq.service;

import java.util.List;

public interface FaqMapper {
	List<FaqVO> faqSelectList();
	FaqVO faqSelect(FaqVO vo);
	int faqInsert(FaqVO vo);
	int faqUpdate(FaqVO vo);
	int faqDelete(FaqVO vo);
	List<FaqVO> faqSearch(FaqVO vo); // 검색
}

