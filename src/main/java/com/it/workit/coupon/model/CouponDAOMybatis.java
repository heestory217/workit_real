package com.it.workit.coupon.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAOMybatis implements CouponDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "com.mybatis.mapper.coupon.";
	
	@Override
	public CouponVO selectCoupon(String couponName) {
		return sqlSession.selectOne(namespace+"selectCoupon", couponName);
	}
}
