package co.maeumi.prj.counselor.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.counselor.service.CounselorMapper;
import co.maeumi.prj.counselor.service.CounselorService;
import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.personalcounsel.service.PersonalcounselVO;
import co.maeumi.prj.service.Search;

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

	@Override
	public List<CounselorVO> counselorCareerList(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorCareerList(cvo);
	}

	@Override
	public int counselorCareerDelete(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorCareerDelete(cvo);
	}

	@Override
	public int counselorCareerInsert(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorCareerInsert(cvo);
	}

	@Override

	public CounselorVO counselorFindEmail(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorFindEmail(cvo);
	}

	public List<CounselorVO> counselorCertificationList(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorCertificationList(cvo);
	}

	@Override
	public int counselorCertificationDelete(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorCertificationDelete(cvo);
	}

	@Override
	public int counselorCertificationInsert(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorCertificationInsert(cvo);
	}

	@Override
	public List<CounselorVO> counselorinfoList(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorinfoList(cvo);
	}

	@Override
	public int counselorinfoDelete(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorinfoDelete(cvo);
	}

	@Override
	public int counselorinfoInsert(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorinfoInsert(cvo);
	}

	@Override
	public List<CounselorVO> counselortimeList(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselortimeList(cvo);
	}

	@Override
	public int counselortimeDelete(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselortimeDelete(cvo);
	}

	@Override
	public int counselortimeInsert(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselortimeInsert(cvo);

	}

	@Override
	public int getCounselorListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getCounselorListCnt(svo);
	}

	@Override
	public List<CounselorVO> counselorSearchselect(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.counselorSearchselect(svo);
	}

	@Override
	public List<CounselorVO> counselorTimeAndDay(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorTimeAndDay(cvo);
	}

	@Override
	public List<CounselorVO> reservedCounsel(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.reservedCounsel(cvo);
	}

	@Override
	public int counselorGradeInsert(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorGradeInsert(cvo);
	}

	@Override
	public int counselorGradeUpdate(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorGradeUpdate(cvo);
	}

	@Override
	public List<CounselorVO> counselorGradeList(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorGradeList(cvo);
	}

	@Override
	public int counselorUpdate(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorUpdate(cvo);
	}

	@Override

	public int getUserCounselorListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getUserCounselorListCnt(svo);
	}

	@Override
	public List<PersonalcounselVO> userCounselorSearchList(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.userCounselorSearchList(svo);

	public CounselorVO counselorFindPassword(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.counselorFindPassword(cvo);
	}

	@Override
	public int cPasswordUpdate(CounselorVO cvo) {
		// TODO Auto-generated method stub
		return map.cPasswordUpdate(cvo);

	}


	
}
