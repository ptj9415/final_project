package co.maeumi.prj.groupcounsel.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GroupcounselVO {
	private int gc_no;		  //그룹 상담 번호
	private String c_email;		  //회원 이메일(조인용)
	private String gc_date;		  //그룹 상담일
	private String gc_startdate;  //그룹 상담 시작일
	private String gc_finaldate;  //그룹 상담 마감일
	private String gc_title;	  //그룹 상담 제목
	private String gc_type;		  //그룹 상담 종류
	private String gc_min_person; //그룹 상담 최소 인원
	private String gc_max_person; //그룹 상담 최대 인원
	private String gc_price;	  //그룹 상담 가격
	private String gc_time;		  //그룹 상담 시작 시간
	private String gc_sumnail;	  //그룹 상담 썸네일
	private String gc_kakao;	  //그룹 상담 주소
	private String gc_report; 	  //그룹 상담 후 내용
	private String gc_result; 	  //그룹 상담 결과
	private String gc_person; 	  //현재 인원
	private String gc_infos;      //그룹 상담 개설 내용 (에디터 들어감).
	private String gc_status;      //그룹 상담 진행인지 아닌지
	private String gc_name;
	
	//그룹상담 예약
	private String gr_no;
	private String m_email;
	private String gr_subject;
	private String gr_reservedate;
	private String gr_status;
	private String gr_refund;
	private String gr_price;
	
	//그룹상담 신청용
	private String m_nickname;
	
	//그룹상담 상담사
	private String c_name;
	private String c_phone;
	private String c_picturepath;
	
}
