package co.maeumi.prj.therapy.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import co.maeumi.prj.therapy.service.TherapyMapper;
import co.maeumi.prj.therapy.service.TherapyService;
import co.maeumi.prj.therapy.service.TherapyVO;

@Repository("therapyDao")
public class TherapyServiceImpl implements TherapyService {

	@Autowired
	private TherapyMapper map;

	@Override
	public List<TherapyVO> therapyList() {
		return map.therapyList();
	}

	@Override
	public int InsertTherapy(TherapyVO vo) {
		// TODO Auto-generated method stub
		return map.InsertTherapy(vo);
	}

}
