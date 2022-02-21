package co.maeumi.prj.counselor.service;

import java.util.List;

public interface CounselorMapper {
	List<CounselorVO> counselorSelectList();
	CounselorVO counselorSelect(CounselorVO vo);
	int counselorPictureUpdate(CounselorVO vo);
}
