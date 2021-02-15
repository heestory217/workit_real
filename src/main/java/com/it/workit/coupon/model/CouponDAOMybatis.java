package com.it.workit.coupon.model;

import java.util.List;

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

	@Override
	public List<CouponVO> selectAll() {
		return sqlSession.selectList(namespace+"selectAll");
	}

	@Override
	public int insertCoupon(CouponVO vo) {
		return sqlSession.insert(namespace+"insertCoupon", vo);
	}

	@Override
	public int updateCoupon(CouponVO vo) {
		return sqlSession.update(namespace+"updateCoupon", vo);
	}

	@Override
	public int deleteCoupon(int couponNo) {
		return sqlSession.delete(namespace+"deleteCoupon", couponNo);
	}
}
