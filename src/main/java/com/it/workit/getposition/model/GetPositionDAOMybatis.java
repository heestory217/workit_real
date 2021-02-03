package com.it.workit.getposition.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GetPositionDAOMybatis implements GetPositionDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="";
}
