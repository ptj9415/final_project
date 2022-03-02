package co.maeumi.prj.personalcounsel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.personalcounsel.service.PersonalcounselMapper;
import co.maeumi.prj.personalcounsel.service.PersonalcounselService;
import co.maeumi.prj.personalcounsel.service.PersonalcounselVO;

@Repository("personalCounselDao")
public class PersonalcounselServiceImpl implements PersonalcounselService {

	@Autowired
	private PersonalcounselMapper map;

	@Override
	public List<PersonalcounselVO> CounselorSelectList(PersonalcounselVO vo) {

		return map.CounselorSelectList(vo);
	}

	@Override
	public PersonalcounselVO CounselorSelect(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.CounselorSelect(vo);
	}

}
