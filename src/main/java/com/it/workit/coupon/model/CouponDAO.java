package com.it.workit.coupon.model;

import java.util.List;

public interface CouponDAO {
	CouponVO selectCoupon(String couponName);
	CouponVO selectCouponByNo(int couponNo);
	
	List<CouponVO> selectAll();
	int insertCoupon (CouponVO vo);
	int updateCoupon (CouponVO vo);
	int deleteCoupon (int couponNo);
}
