package co.maeumi.prj.groupCounsel.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class group_CounselReserveVO {
	private String gr_no;
	private String m_email;
	private String gc_no;
	private String gr_subject;
	private Date gr_reservedate;
	private String gr_status;
	private String gr_refund;
}
