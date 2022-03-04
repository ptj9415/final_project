package co.maeumi.prj.boardReply.service;

import lombok.Data;

@Data
public class BoardReplyVO {
	private int b_no;	// 게시글
	private int br_no;	// 게시글 댓글
	private String br_content;
	private String br_email;
	private String br_wdate;
	private String br_name;
}
