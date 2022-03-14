package co.maeumi.prj.salary.service;

import java.util.List;

public interface SalaryMapper {
	List<SalaryVO> salaryList();
	List<SalaryVO> salarySearch(SalaryVO vo);
	List<SalaryVO> salarySecondList(SalaryVO vo);
	
}
