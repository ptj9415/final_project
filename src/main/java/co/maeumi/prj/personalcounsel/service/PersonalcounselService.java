package co.maeumi.prj.personalcounsel.service;

import java.util.List;

public interface PersonalcounselService {

	List<PersonalcounselVO> CounselorSelectList(PersonalcounselVO vo);
	PersonalcounselVO CounselorSelect(PersonalcounselVO vo);

}
