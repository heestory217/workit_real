package com.it.workit.paidService.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PaidServiceDAOMybatis implements PaidServiceDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "com.mybatis.mapper.paidService.";
	
	@Override
	public PaidServiceVO selectPaidServByServiceNo(int paidServiceNo) {
		return sqlSession.selectOne(namespace+"selectPaidServByServiceNo", paidServiceNo);
	}
}
