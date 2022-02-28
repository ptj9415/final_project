package co.maeumi.prj.therapy.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import co.maeumi.prj.therapy.service.TherapyMapper;
import co.maeumi.prj.therapy.service.TherapyService;

@Repository("therapylDao")
public class TherapyServiceImpl implements TherapyService {

	@Autowired
	private TherapyMapper map;

}
