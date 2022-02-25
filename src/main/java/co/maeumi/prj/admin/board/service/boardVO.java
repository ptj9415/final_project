package co.maeumi.prj.admin.board.service;

import lombok.Data;

@Data
public class boardVO {
	private String b_no;
	private String b_subject;
	private String b_title;
	private String b_content;
	private String b_email;
	private String b_wdate;
	private String c_name;
	private String b_cnt; 	// 조회수
}
