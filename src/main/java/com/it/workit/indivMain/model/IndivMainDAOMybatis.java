package com.it.workit.indivMain.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndivMainDAOMybatis implements IndivMainDAO{
	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace="com.mybatis.mapper.indivMain.";
	
	//채용 마감 임박순
	@Override
	public List<Map<String, Object>> selectByDeadline() {
		return sqlSession.selectList(namespace+"selectByDeadline");
	}

	@Override
	public List<Map<String, Object>> selectNesPost() {
		return sqlSession.selectList(namespace+"selectNesPost");
	}
	
}
