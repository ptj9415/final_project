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
	private int gc_no;
	private Date or_date;
	private String or_type;
	private String or_price;
	private String m_nickname;
	private String m_email;
}
