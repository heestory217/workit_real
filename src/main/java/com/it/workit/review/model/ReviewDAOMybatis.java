package com.it.workit.review.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.ReviewPageVO;

@Repository
public class ReviewDAOMybatis implements ReviewDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "com.mybatis.mapper.review.";
	
	@Override
	public List<ReviewVO> selectReviewList(ReviewPageVO searchVo) {
		return sqlSession.selectList(namespace+"selectReviewList", searchVo);
	}

	@Override
	public int selectTotalRecord(ReviewPageVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}
	
	
}
