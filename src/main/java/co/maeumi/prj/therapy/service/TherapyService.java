package co.maeumi.prj.therapy.service;

import java.util.List;

public interface TherapyService {
	List<TherapyVO> therapyList();
	int InsertTherapy(TherapyVO vo);
}
