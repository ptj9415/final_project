package co.maeumi.prj.board.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BoardVO {
	private int b_no;
	private String b_subject;
	private String b_title;
	private String b_content;
	private String b_email;
	private String b_wdate;
	private String m_nickname;
	private String c_name;
	private int b_hit; 	// 조회수
}
