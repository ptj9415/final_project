package co.maeumi.prj.groupCounsel.service;

import java.util.List;

import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.pagination.Pagination;

public interface groupCounselMapper {
	int insertGroupCounsel(group_CounselVO vo);
	List<group_CounselVO> groupSelectList();
	int countGroupCounsel();
	int searchcountGroupCounsel(Pagination page);
	List<group_CounselVO> pageSelectList(Pagination page);
	List<group_CounselVO> searchpageSelectList(Pagination page);
	List<group_CounselJoinVO> joinSelectList(group_CounselJoinVO vo);
	
	int GroupUserDelete(group_CounselReserveVO vo);
	group_CounselReserveVO selectgroupRserve(group_CounselReserveVO vo);
	group_CounselVO selectDetailList(group_CounselVO vo);
	int groupCounselResult(group_CounselVO vo);
}
