package co.maeumi.prj.coupon.service;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CouponVO {
	private String m_email;
	private int c_no;
	private String c_name;
	private String c_price;
	private String c_startdate;
	private String c_finaldate;
}
