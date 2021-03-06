package co.maeumi.prj.member.service;

import java.util.List;

import co.maeumi.prj.service.Search;

public interface MemberService {
	List<MemberVO> memberSelectList();
	MemberVO memberSelect(MemberVO mvo);
	MemberVO memberLogin(MemberVO mvo); 
	boolean memberNicknameCheck(MemberVO mvo); // 닉네임 중복체크
	boolean memberEmailCheck(MemberVO mvo); // 이메일 중복체크
	int memberInsert(MemberVO mvo);
	int memberLeave(MemberVO mvo);  // 회원탈퇴 처리
	
	MemberVO memberFindEmail(MemberVO mvo); // 연락처로 이메일 찾기.
	MemberVO memberFindPassword(MemberVO mvo);  // 이메일, 연락처로 패스워드 조회
	
	List<MemberVO> findEmailList();   // 회원테이블은 동일 연락처, 여러 계정 존재 가능.
	
	MemberVO kakaoSelect(MemberVO mvo);  // 카카오 로그인 조회용 이메일과 가입유형으로 판단.
	MemberVO naverSelect(MemberVO mvo);  // 네이버 로그인 조회용. 

	int getMemberListCnt(Search svo) throws Exception; // 데이터가 총 몇건인지 보여주는 숫자
	public List<MemberVO> memberSearchselect(Search svo) throws Exception; // 검색을 위한 SELECTLIST
	int memberInfoUpdate(MemberVO mvo);
	
	// 마이페이지 이메일과 가입유형 구분
	MemberVO mypageSelectList(MemberVO mvo);
	
	// 닉네임 변경
	int ajaxUpdateNickname(MemberVO mvo);
	
	// 비밀번호 조회
	MemberVO ajaxPassChk(MemberVO mvo);

	// 비밀번호 변경 
	int ajaxUpdatePassword(MemberVO mvo);
	
	// 연락처 정보 수정
	int ajaxUpdatePhone(MemberVO mvo);
	
	// 새로운 비밀번호 수정
	int passwordUpdate(MemberVO mvo);
	
}
