package co.maeumi.prj.personalcounsel.service;

import java.util.List;

import co.maeumi.prj.service.Search;

public interface PersonalcounselService {

	List<PersonalcounselVO> CounselorSelectList(PersonalcounselVO vo);
	PersonalcounselVO CounselorSelect(PersonalcounselVO vo);
	List<PersonalcounselVO> SubnameSelectList(PersonalcounselVO vo);
	
	List<PersonalcounselVO> PersonalCounselList(PersonalcounselVO vo);//개인상담관리 리스트

	PersonalcounselVO PersonalCounselSelect(PersonalcounselVO vo); //개인상담 관리 디테일
	int PersonalCounselUpdate(PersonalcounselVO vo); //개인상담 관리 상담일지 업데이트
	int PersonalCounselDelete(PersonalcounselVO vo); //개인상담 관리삭제
	
	
	int personalCounselInsert(PersonalcounselVO vo);
	int personalMax();
	
	int getPRListCnt(Search svo);
	public List<PersonalcounselVO> prSearchSelect(Search svo) throws Exception;
	
	PersonalcounselVO counselorResultSelect(PersonalcounselVO vo);

	List<PersonalcounselVO> PersonalCounselCount(PersonalcounselVO vo); // 개인상담 건수 집계
	List<PersonalcounselVO> PersonalCounselSales(PersonalcounselVO vo); // 개인상담 매출 통계
	
	List<PersonalcounselVO>  searchSalesData(PersonalcounselVO vo); // 개인상담 매출 통계 search
}
