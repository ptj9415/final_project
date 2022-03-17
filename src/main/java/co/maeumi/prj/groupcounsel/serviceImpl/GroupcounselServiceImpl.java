package co.maeumi.prj.groupcounsel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.groupcounsel.service.GroupcounselMapper;
import co.maeumi.prj.groupcounsel.service.GroupcounselService;
import co.maeumi.prj.groupcounsel.service.GroupcounselVO;
import co.maeumi.prj.service.Pagination;
import co.maeumi.prj.service.Search;

@Repository("groupCounselDao")
public class GroupcounselServiceImpl implements GroupcounselService {

	@Autowired
	private GroupcounselMapper map;

	@Override
	public int insertGroupCounsel(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.insertGroupCounsel(vo);
	}

	@Override
	public List<GroupcounselVO> groupSelectList() {
		// TODO Auto-generated method stub
		return map.groupSelectList();
	}

	@Override
	public int countGroupCounsel() {
		// TODO Auto-generated method stub
		return map.countGroupCounsel();
	}

	@Override
	public int searchcountGroupCounsel(Pagination page) {
		// TODO Auto-generated method stub
		return map.searchcountGroupCounsel(page);
	}

	@Override
	public List<GroupcounselVO> pageSelectList(Pagination page) {
		// TODO Auto-generated method stub
		return map.pageSelectList(page);
	}

	@Override
	public List<GroupcounselVO> searchpageSelectList(Pagination page) {
		// TODO Auto-generated method stub
		return map.searchpageSelectList(page);
	}

	@Override
	public List<GroupcounselVO> joinSelectList(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.joinSelectList(vo);
	}

	@Override
	public int GroupUserDelete(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.GroupUserDelete(vo);
	}

	@Override
	public GroupcounselVO selectgroupRserve(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.selectgroupRserve(vo);
	}

	@Override
	public GroupcounselVO selectDetailList(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.selectDetailList(vo);
	}

	@Override
	public int groupCounselResult(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.groupCounselResult(vo);
	}

	@Override
	public GroupcounselVO selectUserGroup(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.selectUserGroup(vo);
	}

	@Override
	public GroupcounselVO selectInvoice(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.selectInvoice(vo);
	}

	@Override
	public int groupReserveInsert(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.groupReserveInsert(vo);
	}

	@Override
	public int getGCListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getGCListCnt(svo);
	}

	@Override
	public List<GroupcounselVO> gcSearchselect(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.gcSearchselect(svo);
	}

	@Override
	public List<GroupcounselVO> gcApplySearchselect(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.gcApplySearchselect(svo);
	}

	@Override
	public int getGCapplyListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getGCapplyListCnt(svo);
	}

	@Override
	public GroupcounselVO selectGroupCounselInfo(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.selectGroupCounselInfo(vo);
	}

	@Override
	public int groupCounselUpdate(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.groupCounselUpdate(vo);
	}

	@Override
	public int groupUpdatePerson(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.groupUpdatePerson(vo);

	}

	@Override
	public int groupCounselClose(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.groupCounselClose(vo);
	}

	@Override
	public List<GroupcounselVO> groupList(GroupcounselVO vo) {
		// TODO Auto-generated method stub
		return map.groupList(vo);
	}

	@Override
	public int maxGroupGrno() {
		// TODO Auto-generated method stub
		return map.maxGroupGrno();
	}

}
