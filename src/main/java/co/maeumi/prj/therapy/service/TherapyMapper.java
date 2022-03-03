package co.maeumi.prj.therapy.service;

import java.util.List;

public interface TherapyMapper {
	List<TherapyVO> therapyList();
	int InsertTherapy(TherapyVO vo);
	TherapyVO selectTherapy(TherapyVO vo);
	int UpdateTherapy (TherapyVO vo);
	int DeleteTherapy (TherapyVO vo);
}
