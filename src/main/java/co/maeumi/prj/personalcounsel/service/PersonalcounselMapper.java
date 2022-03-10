package co.maeumi.prj.personalcounsel.service;

import java.util.List;

public interface PersonalcounselMapper {
	List<PersonalcounselVO> CounselorSelectList(PersonalcounselVO vo);
	PersonalcounselVO CounselorSelect(PersonalcounselVO vo);
	List<PersonalcounselVO> SubnameSelectList(PersonalcounselVO vo);
	
	List<PersonalcounselVO> PersonalCounselList(PersonalcounselVO vo);//개인상담관리 리스트
	PersonalcounselVO PersonalCounselSelect(PersonalcounselVO vo); //개인상담 관리 디테일
	int PersonalCounselUpdate(PersonalcounselVO vo); //개인상담 관리 상담일지 업데이트
	int PersonalCounselDelete(PersonalcounselVO vo); //개인상담 관리삭제
	
	int personalCounselInsert(PersonalcounselVO vo);
	int personalMax();
	
	PersonalcounselVO counselorResultSelect(PersonalcounselVO vo);

	
}
