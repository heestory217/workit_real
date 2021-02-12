package com.it.workit.admin.website.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WebsiteManageDAOMybatis implements WebsiteManageDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.website.";
	
	@Override
	public int updateTotalCount() {
		return sqlSession.update(namespace+"updateTotalCount");
	}

	@Override
	public int selectTotalVisitor() {
		return sqlSession.selectOne(namespace+"selectTotalVisitor");
	}
}
