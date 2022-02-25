package co.maeumi.prj.service;

import java.util.List;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO mvo);
	MemberVO memberLogin(MemberVO mvo); 
	boolean memberNicknameCheck(MemberVO mvo); // 닉네임 중복체크
	boolean memberEmailCheck(MemberVO mvo); // 이메일 중복체크
	int memberInsert(MemberVO mvo);
	
	MemberVO memberFindEmail(MemberVO mvo); // 연락처로 이메일 찾기.
	List<MemberVO> findEmailList();   // 회원테이블은 동일 연락처, 여러 계정 존재 가능.
	
	MemberVO kakaoSelect(MemberVO mvo);  // 카카오 로그인 조회용 이메일과 가입유형으로 판단.
	MemberVO naverSelect(MemberVO mvo);  // 네이버 로그인 조회용. 
	
}
