package com.it.workit.comments.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CommentsDAOMybatis implements CommentsDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.comments.";

	@Override
	public int insertReply(CommentsVO vo) {
		return sqlSession.insert(namespace+"insertReply", vo);
	}

	@Override
	public List<CommentsVO> selectComment(int cmntNo) {
		return sqlSession.selectList(namespace+"selectComment", cmntNo);
	}
	
	
}
