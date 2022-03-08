package co.maeumi.prj.personalcounsel.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PersonalcounselVO {
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
	private int pr_status;
	private String pr_type;
	private String pc_report;
	private String pc_result;
	private String m_nickname;
	
	
}
