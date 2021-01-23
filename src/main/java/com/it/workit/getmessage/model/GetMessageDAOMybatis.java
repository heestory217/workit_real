package com.it.workit.getmessage.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GetMessageDAOMybatis implements GetMessageDAO{
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace ="com.mybatis.mapper.message.";
	
	@Override
	public int insertGetMessage(GetMessageVO gVo) {
		return sqlSession.insert(namespace+"insertGetMessage", gVo);
	}

	@Override
	public int updateReadCount(int messageNo) {
		return sqlSession.update(namespace+"updateReadCount", messageNo);
	}
	
}
