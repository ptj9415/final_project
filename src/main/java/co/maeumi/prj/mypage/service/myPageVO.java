package co.maeumi.prj.mypage.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class myPageVO {
	private int ccg_no;
	private String ccg_name;
	private String ccg_subname;
	private String c_email;
	
	private String c_name;
	private String c_gender;
	private String c_phone;
	private String c_grade;
	private String c_password;
	private String c_address;
	private String c_picture;
	private String c_picturepath;
	private String c_status;
	
	private String cc_no;
	private String cc_email;
	private String cc_subject;
	
	private int p_no;
	private String e_email;
	private int p_kakao;
	private String p_kakaoprice;
	private int p_zoom;
	private String p_zoomprice;
	private int p_phone;
	private String p_phoneprice;
	
	private int pr_no;
	private String pr_date;
	private String pr_price;
	private String pr_time;
	private String pr_status;
	private String pr_type;
	private String pc_report;
	private String pc_result;
	private String m_nickname;
	

	private String m_email; 
	
	private int or_no;
	private String or_uid;
	private Date or_date;
	private String or_type;
	private String or_price;
	private String or_status;
	
	//그룹 상담이랑 조인
	private int gc_no;
	private String gc_date;
	private String gc_type;
	private String gc_name;
	private String gc_time;
	private String gc_title;
	private String gc_startdate;  //그룹 상담 시작일
	private String gc_finaldate;  //그룹 상담 마감일
	private int gc_min_person; //그룹 상담 최소 인원
	private int gc_max_person; //그룹 상담 최대 인원
	private String gc_price;	  //그룹 상담 가격
	private String gc_sumnail;	  //그룹 상담 썸네일
	private String gc_kakao;	  //그룹 상담 주소
	private String gc_report; 	  //그룹 상담 후 내용
	private String gc_result; 	  //그룹 상담 결과
	private int gc_person; 	  //현재 인원
	private String gc_infos;      //그룹 상담 개설 내용 (에디터 들어감).
	private String gc_status;      //그룹 상담 진행인지 아닌지
	
	//그룹 상담 예약
	private int gr_no;
	private String gr_subject;
	private String gr_reservedate;
	private String gr_status;
	private String gr_refund;
	private String gr_price;
}
