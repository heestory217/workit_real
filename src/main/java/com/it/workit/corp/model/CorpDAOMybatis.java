package com.it.workit.corp.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CorpDAOMybatis implements CorpDAO {

	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.corp.";
	
	@Override
	public int insertCorp(CorpVO vo) {
		return sqlSession.insert(namespace+"insertCorp", vo);
	}
}
