package co.maeumi.prj.counselor.service;

import java.util.List;

public interface CounselorMapper {
	List<CounselorVO> counselorSelectList();
	CounselorVO counselorSelect(CounselorVO cvo);
	CounselorVO counselorLogin(CounselorVO cvo);
	int counselorPictureUpdate(CounselorVO cvo);
	boolean counselorEmailCheck(CounselorVO cvo); // 상담사 이메일 중복체크.
	int counselorInsert(CounselorVO cvo);
	List<CounselorVO> counselorCareerList(CounselorVO cvo);
	int counselorCareerDelete(CounselorVO cvo);
	int counselorCareerInsert(CounselorVO cvo);
	CounselorVO counselorFindEmail(CounselorVO cvo);
}
