package com.it.workit.getmessage.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public int updategetMsgImpflag(int messageNo) {
		return sqlSession.update(namespace+"updategetMsgImpflag", messageNo);
	}

	@Override
	public List<Map<String, Object>> selectImpMessage(int userNo) {
		return sqlSession.selectList(namespace+"selectImpMessage", userNo);
	}
}
