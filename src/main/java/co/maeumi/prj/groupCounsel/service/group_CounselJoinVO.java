package co.maeumi.prj.groupCounsel.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class group_CounselJoinVO {
	private String m_nickname;
	private String m_email;
	private String gr_reservedate;
	private String gr_status;
	private String gr_subject;
	private String c_email;
	private String gr_no;
}
