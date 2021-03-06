package co.maeumi.prj.counselor.service;

import java.util.List;

import co.maeumi.prj.personalcounsel.service.PersonalcounselVO;
import co.maeumi.prj.service.Search;

public interface CounselorMapper {
	List<CounselorVO> counselorSelectList();
	CounselorVO counselorLogin(CounselorVO cvo);
	CounselorVO counselorSelect(CounselorVO cvo);
	int counselorPictureUpdate(CounselorVO cvo);
	boolean counselorEmailCheck(CounselorVO cvo); // 상담사 이메일 중복체크.
	int counselorInsert(CounselorVO cvo);
	CounselorVO counselorFindPassword(CounselorVO cvo); // 상담사 이메일/연락처로 인증유무
	int cPasswordUpdate(CounselorVO cvo);   // 비밀번호 찾아서 수정
	
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
	
	//등급변경신청
	List<CounselorVO> counselorGradeList(CounselorVO cvo);
	int counselorGradeInsert(CounselorVO cvo);
	int counselorGradeUpdate(CounselorVO cvo);
	int counselorUpdate(CounselorVO cvo);
	
	//상담사 카테고리 수정
	int counselorCateUpdate(CounselorVO cvo);
	int counselorPriceUpdate(CounselorVO cvo);
	CounselorVO counselorPriceSelect(CounselorVO cvo);
	
	int getUserCounselorListCnt(Search svo) throws Exception;
	public List<PersonalcounselVO> userCounselorSearchList(Search svo) throws Exception;
	CounselorVO userCounselorSelect(CounselorVO cvo);

}
