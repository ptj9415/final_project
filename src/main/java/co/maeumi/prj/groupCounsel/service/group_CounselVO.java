package co.maeumi.prj.groupCounsel.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class group_CounselVO {
	private String gc_no;		  //그룹 상담 번호
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
	
}
