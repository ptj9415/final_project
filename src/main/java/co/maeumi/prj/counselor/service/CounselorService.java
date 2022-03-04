package co.maeumi.prj.counselor.service;

import java.util.List;

import co.maeumi.prj.service.Search;

public interface CounselorService {
	List<CounselorVO> counselorSelectList();
	CounselorVO counselorLogin(CounselorVO cvo);
	CounselorVO counselorSelect(CounselorVO cvo);
	int counselorPictureUpdate(CounselorVO cvo);
	boolean counselorEmailCheck(CounselorVO cvo); // 상담사 이메일 중복체크.
	int counselorInsert(CounselorVO cvo);
	
	int getCounselorListCnt(Search svo) throws Exception;
	public List<CounselorVO> counselorSearchselect(Search svo) throws Exception;
	
	//상담 경력
	List<CounselorVO> counselorCareerList(CounselorVO cvo);
	int counselorCareerDelete(CounselorVO cvo);
	int counselorCareerInsert(CounselorVO cvo);

  //이메일 
	CounselorVO counselorFindEmail(CounselorVO cvo);

	
	//자격사항
	List<CounselorVO> counselorCertificationList(CounselorVO cvo);
	int counselorCertificationDelete(CounselorVO cvo);
	int counselorCertificationInsert(CounselorVO cvo);
	
	//자격사항
	List<CounselorVO> counselorinfoList(CounselorVO cvo);
	int counselorinfoDelete(CounselorVO cvo);
	int counselorinfoInsert(CounselorVO cvo);
	
	//상담시간
	List<CounselorVO> counselortimeList(CounselorVO cvo);
	int counselortimeDelete(CounselorVO cvo);
	int counselortimeInsert(CounselorVO cvo);
	List<CounselorVO> counselorTimeAndDay(CounselorVO cvo);
	List<CounselorVO> reservedCounsel(CounselorVO cvo);

}
