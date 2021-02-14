package com.it.workit.admin.website.model;

import java.util.Map;

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

	@Override
	public Map<String, Object> selectSiteIntro() {
		return sqlSession.selectOne(namespace+"selectSiteIntro");
	}
	
	@Override
	public int updateSiteIntro(WebsiteManageVO vo) {
		return sqlSession.update(namespace+"updateSiteIntro", vo);
	}
}
