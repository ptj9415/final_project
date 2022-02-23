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
	public CounselorVO counselorSelect(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorSelect(cvo);
	}

	@Override
	public int counselorPictureUpdate(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorPictureUpdate(cvo);
	
	}

	@Override
	public boolean counselorEmailCheck(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorEmailCheck(cvo);
	}

	@Override
	public int counselorInsert(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorInsert(cvo);
	}

	@Override
	public CounselorVO counselorLogin(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorLogin(cvo);
	}
	
}
