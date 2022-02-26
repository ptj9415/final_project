package co.maeumi.prj.groupCounsel.service;

import java.util.List;

import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.pagination.Pagination;
import co.maeumi.prj.service.MemberVO;

public interface GroupCounslerService {
	int insertGroupCounsel(group_CounselVO vo); //그룹 상담 개설 인서트
	List<group_CounselVO> groupSelectList();    //그룹 상담 전체 목록 조회
	int countGroupCounsel();					//그룹 상담 전체 수 조회
	int searchcountGroupCounsel(Pagination page);  //검색 및 페이지 네이션 된 리스트 수 조회
	List<group_CounselVO> pageSelectList(Pagination page);  //페이지 네이션 된 리스트 조회하기.
	List<group_CounselVO> searchpageSelectList(Pagination page); //검색 및 페이지 네이션 된 리스트 조회하기.
	List<group_CounselJoinVO> joinSelectList(group_CounselJoinVO vo);
	
	int GroupUserDelete(group_CounselReserveVO vo);
	group_CounselReserveVO selectgroupRserve(group_CounselReserveVO vo);
	
}
