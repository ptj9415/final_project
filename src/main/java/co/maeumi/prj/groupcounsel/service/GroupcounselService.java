package co.maeumi.prj.groupcounsel.service;

import java.util.List;

import co.maeumi.prj.service.Pagination;
import co.maeumi.prj.service.Search;

public interface GroupcounselService {
	int insertGroupCounsel(GroupcounselVO vo); //그룹 상담 개설 인서트
	List<GroupcounselVO> groupSelectList();    //그룹 상담 전체 목록 조회
	int countGroupCounsel();					//그룹 상담 전체 수 조회
	int searchcountGroupCounsel(Pagination page);  //검색 및 페이지 네이션 된 리스트 수 조회
	List<GroupcounselVO> pageSelectList(Pagination page);  //페이지 네이션 된 리스트 조회하기.
	List<GroupcounselVO> searchpageSelectList(Pagination page); //검색 및 페이지 네이션 된 리스트 조회하기.
	
	List<GroupcounselVO> joinSelectList(GroupcounselVO vo); //3way 조인 리스트 가져오기
	
	int GroupUserDelete(GroupcounselVO vo);  //delete 라고 하지만 상태값 업데이트 구문임
	GroupcounselVO selectgroupRserve(GroupcounselVO vo); //예약자 리스트 조회
	GroupcounselVO selectDetailList(GroupcounselVO vo);
	int groupCounselResult(GroupcounselVO vo); // 그룹 상담 결과 등록하기
	GroupcounselVO selectUserGroup(GroupcounselVO vo); // 그룹상담 상세목록 보여주기
	GroupcounselVO selectInvoice (GroupcounselVO vo); // 그룹상담 결제 페이지 조인 구문.
	int groupReserveInsert(GroupcounselVO vo); //그룹 상담 예약에 값 넣어주기.
	

	int getGCListCnt(Search svo) throws Exception; // 데이터가 총 몇건인지 보여주는 숫자
	public List<GroupcounselVO> gcSearchselect(Search svo) throws Exception; // 검색을 위한 SELECTLIST
	int getGCapplyListCnt(Search svo) throws Exception; // 데이터가 총 몇건인지 보여주는 숫자
	public List<GroupcounselVO> gcApplySearchselect(Search svo) throws Exception;
	
	GroupcounselVO selectGroupCounselInfo(GroupcounselVO vo);
	int groupCounselUpdate(GroupcounselVO vo);
	int groupCounselClose(GroupcounselVO vo);

	int groupUpdatePerson(GroupcounselVO vo); // 그룹 상담 예약 후 예약 인원 증가
	
	List<GroupcounselVO> groupList(GroupcounselVO vo);//메인화면 그룹상담 탭
	
	int maxGroupGrno();
}
