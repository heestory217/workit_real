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
	public int insertWebsiteManage(WebsiteManageVO vo) {
		return sqlSession.insert(namespace+"insertWebsiteManage", vo);
	}
	
	@Override
	public Map<String, Object> selectWebsiteManage(String websitemanageKind) {
		return sqlSession.selectOne(namespace+"selectWebsiteManage", websitemanageKind);
	}
	
	@Override
	public int updateWebsiteManage(WebsiteManageVO vo) {
		return sqlSession.update(namespace+"updateWebsiteManage", vo);
	}
}
