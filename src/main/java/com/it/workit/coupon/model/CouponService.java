package com.it.workit.coupon.model;

import java.util.List;

public interface CouponService {
	CouponVO selectCoupon(String couponName);
	
	List<CouponVO> selectAll();
	int insertCoupon (CouponVO vo);
	int updateCoupon (CouponVO vo);
	int deleteCoupon (int couponNo);
}
