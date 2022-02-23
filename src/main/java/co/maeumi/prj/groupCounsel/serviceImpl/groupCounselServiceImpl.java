package co.maeumi.prj.groupCounsel.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.groupCounsel.service.GroupCounslerService;
import co.maeumi.prj.groupCounsel.service.groupCounselMapper;
import co.maeumi.prj.groupCounsel.service.group_CounselVO;

@Repository("groupCounselDao")
public class groupCounselServiceImpl implements GroupCounslerService {
	@Autowired
	private groupCounselMapper map;
	
	@Override
	public int insertGroupCounsel(group_CounselVO vo) {
		return map.insertGroupCounsel(vo);
	}
	
}
