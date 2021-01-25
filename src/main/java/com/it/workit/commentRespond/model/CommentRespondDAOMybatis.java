package com.it.workit.commentRespond.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentRespondDAOMybatis implements CommentRespondDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.commentRespond.";
	
	//답변 등록
	@Override
	public int insertComnt(CommentRespondVO vo) {
		return sqlSession.insert(namespace+"insertComnt", vo);
	}
	
	
}
