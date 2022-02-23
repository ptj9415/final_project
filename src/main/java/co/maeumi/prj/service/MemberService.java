package co.maeumi.prj.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO mvo);
	MemberVO memberLogin(MemberVO mvo); 
	boolean memberNicknameCheck(MemberVO mvo); // 닉네임 중복체크
	boolean memberEmailCheck(MemberVO mvo); // 이메일 중복체크
	int memberInsert(MemberVO mvo);
}
