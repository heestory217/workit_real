package com.it.workit.review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOMybatis implements ReviewDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "com.mybatis.mapper.review.";
	
	@Override
	public List<ReviewVO> selectReviewList(int corpNo) {
		return sqlSession.selectList(namespace+"selectReviewList", corpNo);
	}
	
	
}
