package co.maeumi.prj.personalcounsel.service;

import java.util.List;

public interface PersonalcounselService {

	List<PersonalcounselVO> CounselorSelectList(PersonalcounselVO vo);
	PersonalcounselVO CounselorSelect(PersonalcounselVO vo);
	List<PersonalcounselVO> SubnameSelectList(PersonalcounselVO vo);
	
	List<PersonalcounselVO> PersonalCounselList(PersonalcounselVO vo);//개인상담관리 리스트

}
