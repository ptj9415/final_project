package co.maeumi.prj.notice.service;

import lombok.Data;

@Data
public class NoticeVO {
	private int n_no; 	        // 공지사항 번호
	private String n_writedate; 	// 작성일
	private String n_writer;		// 작성자
	private String n_title;			// 제목
	private String n_content; 		// 내용
	private int n_hit;			// 조회수
	private String n_filename;		// 첨부파일명
	private String n_pfilename;		// 첨부파일경로
	private String n_category; 		// 말머리
	private String n_status;			// 고정/유동 상태.
	
}
