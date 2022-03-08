package co.maeumi.prj.member.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.member.service.MemberMapper;
import co.maeumi.prj.member.service.MemberService;
import co.maeumi.prj.member.service.MemberVO;
import co.maeumi.prj.service.Search;

@Repository("memberDao")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper map;
	
	@Override
	public List<MemberVO> memberSelectList() {
		// TODO Auto-generated method stub
		return map.memberSelectList();
	}

	@Override
	public MemberVO memberLogin(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.memberLogin(mvo);
	}

	@Override
	public boolean memberNicknameCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.memberNicknameCheck(mvo);
	}

	@Override
	public boolean memberEmailCheck(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.memberEmailCheck(mvo);
	}

	@Override
	public int memberInsert(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.memberInsert(mvo);
	}

	@Override
	public MemberVO memberSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.memberSelect(mvo);
	}

	@Override
	public MemberVO kakaoSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.kakaoSelect(mvo);
	}

	@Override
	public MemberVO naverSelect(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.naverSelect(mvo);
	}

	@Override
	public MemberVO memberFindEmail(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.memberFindEmail(mvo);
	}

	@Override
	public List<MemberVO> findEmailList() {
		// TODO Auto-generated method stub
		return map.findEmailList();
	}

	@Override
	public int getMemberListCnt(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.getMemberListCnt(svo);
	}

	@Override
	public List<MemberVO> memberSearchselect(Search svo) throws Exception {
		// TODO Auto-generated method stub
		return map.memberSearchselect(svo);
	}

	@Override
	public int memberInfoUpdate(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.memberInfoUpdate(mvo);
	}

	@Override
	public MemberVO mypageSelectList(MemberVO mvo) {
		// TODO Auto-generated method stub
		return map.mypageSelectList(mvo);
	}

	
}
