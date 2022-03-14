package co.maeumi.prj.salary.service;

import java.util.List;

public interface SalaryService {
	List<SalaryVO> salaryList();
	List<SalaryVO> salarySearch(SalaryVO vo);
	List<SalaryVO> salarySecondList(SalaryVO vo);
	
}
