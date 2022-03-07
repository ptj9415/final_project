package co.maeumi.prj.member.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MemberVO {
	private String m_email;
	private String m_password;
	private String m_nickname;
	private String m_mbti;
	private String m_phone;
	private String m_type;
	private String m_status;
}
