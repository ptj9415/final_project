package co.maeumi.prj.coupon.service;

import java.util.List;

public interface CouponMapper {
	List<CouponVO> couponSelectList();
	List<Integer> couponRowNum();
	List<CouponVO> couponSelect(CouponVO cvo);
	int couponInsert(CouponVO cvo);
	int couponDelete(CouponVO cvo);
	List<CouponVO> couponMemberSelectList(CouponVO vo);
}
