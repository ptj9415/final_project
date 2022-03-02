package co.maeumi.prj.therapy.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TherapyVO {
	private int t_no;
	private String t_title;
	private String t_subject;
	private String t_picture;
	private Date t_writedate;
	private int t_hit;
	private int t_like_it;
	private String t_name;
}
