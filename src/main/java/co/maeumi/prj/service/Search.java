package co.maeumi.prj.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Search extends Paging {

	private String m_nickname;
	private String m_type;
	private String m_email;
	private String m_phone;

	// 자유 게시판
	private String b_email;
	private String b_title;
	private String b_subject;
	private String b_wdate;



	private String b_content;
	private String b_anony;
	

	// faqVO
	private String f_title;
	private String f_subject;
	private String f_email;
	private String f_wdate;
	private String c_name;

	private String c_gender;
	private String c_grade;
	private String c_birthdate;
	private String c_email;
	private String c_phone;
	private String c_address;
	private String c_status;

	// 공지사항
	private String n_title;
	private String n_category;

	// 오늘의한마디
	private String sc_no;
	private String sc_title;
	private String sc_subject;
	private String sc_today;

	// 심리테라피
	private int t_no;
	private String t_title;
	private String t_subject;
	private String t_picture;
	private Date t_writedate;
	private int t_hit;
	private int t_like_it;
	private String t_name;

	// 그룹상담
	private int gc_no;
	private String gc_date;
	private String gc_startdate;
	private String gc_finaldate;
	private String gc_title;
	private String gc_type;
	private String gc_min_person;
	private String gc_max_person;
	private String gc_price;
	private String gc_time;
	private String gc_sumnail;
	private String gc_kakao;
	private String gc_report;
	private String gc_result;
	private String gc_person;
	private String gc_infos;
	private String gc_status;
	private String gc_name;

	// 그룹상담 예약
	private String gr_no;
	private String gr_subject;
	private String gr_reservedate;
	private String gr_status;
	private String gr_refund;
	private String gr_price;
	private String c_picturepath;

	//개인상담
	private int pr_no;
	private String pr_date;
	private String pr_price;
	private String pr_time;
	private String pr_status;
	private String pr_type;
	private String pc_report;
	private String pc_result;
	private String ccg_subname;
	
}
