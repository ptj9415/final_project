package co.maeumi.prj.counselor.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.counselor.service.CounselorMapper;
import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;

@Repository("counselorDao")
public class CounselorServiceImpl implements CounselorService {
	@Autowired
	private CounselorMapper map;

	@Override
	public List<CounselorVO> counselorSelectList() {
		// TODO Auto-generated method stub
		return map.counselorSelectList();
	}

	@Override
	public CounselorVO counselorSelect(CounselorVO vo) {
		// TODO Auto-generated method stub
		return map.counselorSelect(vo);
	}

	@Override
	public int counselorPictureUpdate(CounselorVO vo) {
		// TODO Auto-generated method stub
		return map.counselorPictureUpdate(vo);
	
	}
	
}
