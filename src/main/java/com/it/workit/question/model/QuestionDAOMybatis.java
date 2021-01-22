package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAOMybatis implements QuestionDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.question.";
	
	//질문 등록
	@Override
	public int insertQstn(QuestionVO vo) {
		return sqlSession.insert(namespace+"insertQstn", vo);
	}

	//질문 조회
	@Override
	public QuestionVO selectQstn(int qstnNo) {
		return sqlSession.selectOne(namespace+"selectQstn", qstnNo);
	}
	
	//질문 수정
	@Override
	public int updateQstn(QuestionVO vo) {
		return sqlSession.update(namespace+"updateQstn", vo);
	}

	@Override
	public List<QuestionVO> selectAllQstn() {
		return sqlSession.selectList(namespace+"selectAllQstn");
	}

	@Override
	public List<Map<String, Object>> selectUserQstnAll(int userNo) {
		return sqlSession.selectList(namespace+"selectUserQstnAll", userNo);
	}
}
