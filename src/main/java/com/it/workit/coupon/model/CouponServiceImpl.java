package com.it.workit.coupon.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CouponServiceImpl implements CouponService{
	@Autowired private CouponDAO couponDao;

	@Override
	public CouponVO selectCoupon(String couponName) {
		return couponDao.selectCoupon(couponName);
	}

	@Override
	public CouponVO selectCouponByNo(int couponNo) {
		return couponDao.selectCouponByNo(couponNo);
	}

	@Override
	public List<CouponVO> selectAll() {
		return couponDao.selectAll();
	}

	@Override
	public int insertCoupon(CouponVO vo) {
		return couponDao.insertCoupon(vo);
	}

	@Override
	public int updateCoupon(CouponVO vo) {
		return couponDao.updateCoupon(vo);
	}

	@Override
	public int deleteCoupon(int couponNo) {
		return couponDao.deleteCoupon(couponNo);
	}
}
