package com.it.workit.prohibit.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProhibitJoinDAOMybatis implements ProhibitJoinDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.applicant.";
	
	@Override
	public int insertProhibit(ProhibitJoinVO vo) {
		return sqlSession.insert(namespace+"insertProhibit", vo);
	}

	@Override
	public int selectIfProhibited(int userPersonalNo) {
		return sqlSession.selectOne(namespace+"selectIfProhibited", userPersonalNo);
	}
	
}
