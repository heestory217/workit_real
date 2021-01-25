package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.question.model.QstnPagingVO;

@Repository
public class CommentRespondDAOMybatis implements CommentRespondDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.commentRespond.";
	
	//답변 등록
	@Override
	public int insertComnt(CommentRespondVO vo) {
		return sqlSession.insert(namespace+"insertComnt", vo);
	}
	
	//답변 조회
	@Override
	public List<Map<String, Object>> selectAllComnt(QstnPagingVO vo) {
		return sqlSession.selectList(namespace+"selectAllComnt",vo);
	}
	
	//답변 개수
	@Override
	public int getTotalCmt(QstnPagingVO vo) {
		return sqlSession.selectOne(namespace+"getTotalCmt", vo);
	}
	
	
}
