package co.maeumi.prj.service;

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
	private String b_wdate = "all";
	
	// faqVO
	private String f_title;
	private String f_subject;
	private String f_email;
	private String f_wdate = "all";
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
	private String n_writedate;
	private String n_content;
	


}
