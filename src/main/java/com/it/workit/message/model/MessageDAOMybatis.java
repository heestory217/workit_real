package com.it.workit.message.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOMybatis implements MessageDAO{
	
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace ="com.mybatis.mapper.message.";
	
	@Override
	public int insertMessage(MessageVO vo) {
		return sqlSession.insert(namespace+"insertMessage", vo);
	}

	@Override
	public List<MessageVO> selectSentMessage(int userNo) {
		return sqlSession.selectList(namespace+"selectSentMessage", userNo);
	}
	
}
