package co.maeumi.prj.order.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class order_datailVO {
	private int or_no;
	private String or_uid;
	private int pr_no;
	private int gr_no;
	private Date or_date;
	private String or_type;
	private String or_price;
	private String m_nickname;
	private String m_email;
	private String or_status;
	
	//그룹 상담이랑 조인
	private int gc_no;
	private String gc_date;
	private String gc_type;
	private String gc_name;
	private String gc_time;
	private String c_email;
	private String gc_title;
	
}
