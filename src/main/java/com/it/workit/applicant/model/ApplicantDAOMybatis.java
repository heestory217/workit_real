package com.it.workit.applicant.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ApplicantDAOMybatis implements ApplicantDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.applicant.";

	@Override
	public ApplicantlistVO selectByUserNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectByUserNo",userNo);
	}
}
