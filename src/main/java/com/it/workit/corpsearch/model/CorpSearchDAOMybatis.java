package com.it.workit.corpsearch.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CorpSearchDAOMybatis implements CorpSearchDAO {

	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.corpsearch.";
	
}
