package com.it.workit.coupon.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService{
	@Autowired private CouponDAO couponDao;

	@Override
	public CouponVO selectCoupon(String couponName) {
		return couponDao.selectCoupon(couponName);
	}
}
