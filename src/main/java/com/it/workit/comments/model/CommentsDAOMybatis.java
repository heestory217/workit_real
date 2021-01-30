package com.it.workit.comments.model;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> selectComment(int cmntNo) {
		return sqlSession.selectList(namespace+"selectComment", cmntNo);
	}

	@Override
	public int updateReply(CommentsVO vo) {
		return sqlSession.update(namespace+"updateReply",vo);
	}

	@Override
	public int deleteReply(int replyNo) {
		return sqlSession.delete(namespace+"deleteReply", replyNo);
	}

	@Override
	public int selectReplyCnt(int commentNo) {
		return sqlSession.selectOne(namespace+"selectReplyCnt", commentNo);
	}
	
	
}
