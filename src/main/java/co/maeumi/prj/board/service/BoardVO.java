package co.maeumi.prj.board.service;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Data
public class BoardVO {
	private int b_no;
	private String b_subject;
	private String b_title;
	private String b_content;
	private String b_email;
	private String b_wdate;
	private String m_nickname;
	private String m_eamil;
	private int b_hit; 	// 조회수
	private String b_anony;	 // 글 익명 처리
}
