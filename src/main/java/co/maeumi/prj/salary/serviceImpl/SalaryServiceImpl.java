package co.maeumi.prj.salary.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.salary.service.SalaryMapper;
import co.maeumi.prj.salary.service.SalaryService;
import co.maeumi.prj.salary.service.SalaryVO;

@Repository("salaryDao")
public class SalaryServiceImpl implements SalaryService {

	@Autowired
	private SalaryMapper map;
	
	@Override
	public List<SalaryVO> salaryList() {
		return map.salaryList();
	}
	@Override
	public List<SalaryVO> salarySearch(SalaryVO vo) {
		return map.salarySearch(vo);
	}
	@Override
	public List<SalaryVO> salarySecondList(SalaryVO vo) {
		// TODO Auto-generated method stub
		return map.salarySecondList(vo);
	}

}
