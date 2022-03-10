package co.maeumi.prj.coupon.serviceImpl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.maeumi.prj.coupon.service.CouponMapper;
import co.maeumi.prj.coupon.service.CouponService;
import co.maeumi.prj.coupon.service.CouponVO;

@Repository("couponDao")
public class CouponServiceImpl implements CouponService {
	@Autowired
	private CouponMapper map;

	@Override
	public List<CouponVO> couponSelectList() {
		// TODO Auto-generated method stub
		return map.couponSelectList();
	}

	@Override
	public int couponInsert(CouponVO cvo) {
		// TODO Auto-generated method stub
		return map.couponInsert(cvo);
	}

	@Override
	public int couponDelete(CouponVO cvo) {
		// TODO Auto-generated method stub
		return map.couponDelete(cvo);
	}

	@Override
	public List<Integer> couponRowNum() {
		// TODO Auto-generated method stub
		return map.couponRowNum();
	}

	@Override
	public List<CouponVO> couponSelect(CouponVO cvo) {
		// TODO Auto-generated method stub
		return map.couponSelect(cvo);
	}

	@Override
	public List<CouponVO> couponMemberSelectList(CouponVO vo) {
		// TODO Auto-generated method stub
		return map.couponMemberSelectList(vo);
	}

	@Override
	public int DeleteCoupon(CouponVO vo) {
		// TODO Auto-generated method stub
		return map.couponDelete(vo);
	}

	
}
