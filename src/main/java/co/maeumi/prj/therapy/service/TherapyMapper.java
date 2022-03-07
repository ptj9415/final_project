package co.maeumi.prj.therapy.service;

import java.util.List;

import co.maeumi.prj.service.Search;

public interface TherapyMapper {
	List<TherapyVO> therapyList();
	int InsertTherapy(TherapyVO vo);
	TherapyVO selectTherapy(TherapyVO vo);
	int UpdateTherapy (TherapyVO vo);
	int DeleteTherapy (TherapyVO vo);
	int getTherapyListCnt(Search svo) throws Exception; // 데이터가 총 몇건인지 보여주는 숫자
	public List<TherapyVO> therapySearchselect(Search svo) throws Exception; // 검색을 위한 SELECTLIST
}
