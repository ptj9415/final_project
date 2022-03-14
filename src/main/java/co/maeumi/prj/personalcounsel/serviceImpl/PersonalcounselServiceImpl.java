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

	@Override
	public List<PersonalcounselVO> SubnameSelectList(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.SubnameSelectList(vo);
	}

	@Override
	public List<PersonalcounselVO> PersonalCounselList(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.PersonalCounselList(vo);
	}

	@Override
	public List<PersonalcounselVO> PersonalCounselCount(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.PersonalCounselCount(vo);
	}
	
	public int personalCounselInsert(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.personalCounselInsert(vo);
	}

	@Override
	public int personalMax() {
		// TODO Auto-generated method stub
		return map.personalMax();
	}

	@Override
	public PersonalcounselVO counselorResultSelect(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.counselorResultSelect(vo);
	}

	@Override
	public PersonalcounselVO PersonalCounselSelect(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.PersonalCounselSelect(vo);
	}

	@Override
	public int PersonalCounselUpdate(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.PersonalCounselUpdate(vo);
	}

	@Override
	public int PersonalCounselDelete(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.PersonalCounselDelete(vo);

	}

	@Override
	public List<PersonalcounselVO> PersonalCounselSales(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.PersonalCounselSales(vo);
	}

	@Override
	public List<PersonalcounselVO> searchSalesData(PersonalcounselVO vo) {
		// TODO Auto-generated method stub
		return map.searchSalesData(vo);
	}

	

}
