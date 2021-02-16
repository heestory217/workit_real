package com.it.workit.message.model;

import java.util.List;
import java.util.Map;

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
	public MessageVO selectMsgJustNow(int userNo) {
		return sqlSession.selectOne(namespace+"selectMsgJustNow", userNo);
	}
	
	@Override
	public List<Map<String, Object>> selectSentMessage(int userNo) {
		return sqlSession.selectList(namespace+"selectSentMessage", userNo);
	}
	
	@Override 
	public List<Map<String, Object>> selectSentMyself(int userNo) {
		return sqlSession.selectList(namespace+"selectSentMyself", userNo);
	}

	@Override
	public List<Map<String, Object>> selectGetMessage(int userNo) {
		return sqlSession.selectList(namespace+"selectGetMessage", userNo);
	}
	
	@Override
	public Map<String, Object> selectByMessageNo(int messageNo) {
		return sqlSession.selectOne(namespace+"selectByMessageNo", messageNo);
	}
	
	//보낸 메세지 삭제 (플래그 업데이트)
	@Override
	public int updateMsgDelflag(int messageNo) {
		return sqlSession.update(namespace+"updateMsgDelflag", messageNo);
	}

}
