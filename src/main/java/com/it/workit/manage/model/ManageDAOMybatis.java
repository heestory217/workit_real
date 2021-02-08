package com.it.workit.manage.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManageDAOMybatis implements ManageDAO{
	
	@Autowired private SqlSessionTemplate sqlSession;
	String namespace="config.mybatis.mapper.oracle.manage.";
	
	@Override
	public int updateTotalCount() {
		return sqlSession.update(namespace+"updateTotalCount");
	}

	@Override
	public int selectTotalVisitor() {
		return sqlSession.selectOne(namespace+"selectTotalVisitor");
	}
	
}
