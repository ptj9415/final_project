package co.maeumi.prj.groupCounsel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.counselor.service.CounselorVO;
import co.maeumi.prj.groupCounsel.service.GroupCounslerService;
import co.maeumi.prj.groupCounsel.service.groupCounselMapper;
import co.maeumi.prj.groupCounsel.service.group_CounselJoinVO;
import co.maeumi.prj.groupCounsel.service.group_CounselReserveVO;
import co.maeumi.prj.groupCounsel.service.group_CounselVO;
import co.maeumi.prj.pagination.Pagination;
import co.maeumi.prj.service.MemberVO;

@Repository("groupCounselDao")
public class groupCounselServiceImpl implements GroupCounslerService {
	@Autowired
	private groupCounselMapper map;
	
	@Override
	public int insertGroupCounsel(group_CounselVO vo) {
		return map.insertGroupCounsel(vo);
	}
	
	@Override
	public List<group_CounselVO> groupSelectList() {
		// TODO Auto-generated method stub
		return map.groupSelectList();
	}

	@Override
	public int countGroupCounsel() {
		// TODO Auto-generated method stub
		return map.countGroupCounsel();
	}

	@Override
	public List<group_CounselVO> pageSelectList(Pagination page) {
		// TODO Auto-generated method stub
		return map.pageSelectList(page);
	}

	@Override
	public List<group_CounselVO> searchpageSelectList(Pagination page) {
		// TODO Auto-generated method stub
		return map.searchpageSelectList(page);
	}

	@Override
	public int searchcountGroupCounsel(Pagination page) {
		// TODO Auto-generated method stub
		return map.searchcountGroupCounsel(page);
	}

	@Override
	public List<group_CounselJoinVO> joinSelectList(group_CounselJoinVO vo) {
		return map.joinSelectList(vo);
	}

	@Override
	public int GroupUserDelete(group_CounselReserveVO vo) {
		// TODO Auto-generated method stub
		return map.GroupUserDelete(vo);
	}

	@Override
	public group_CounselReserveVO selectgroupRserve(group_CounselReserveVO vo) {
		// TODO Auto-generated method stub
		return map.selectgroupRserve(vo);
	}
	
}
