package co.maeumi.prj.personalcounsel.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.personalcounsel.service.PersonalcounselMapper;
import co.maeumi.prj.personalcounsel.service.PersonalcounselService;

@Repository("personalCounselDao")
public class PersonalcounselServiceImpl implements PersonalcounselService {

	@Autowired
	private PersonalcounselMapper map;

}
