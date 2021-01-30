package com.it.workit.indivsearch.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class IndivSearchDAOMybatis implements IndivSearchDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String namespace="config.mybatis.mapper.oracle.indivSearch.";

	@Override
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword) {
		return sqlSession.selectList(namespace+"selectIndivKeyword",keyword);
	}
}
