package com.it.workit.message.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOMybatis implements MessageDAO{
	
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace ="com.mybatis.mapper.message.";
	
}
