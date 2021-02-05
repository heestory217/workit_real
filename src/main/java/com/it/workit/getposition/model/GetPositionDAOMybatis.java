package com.it.workit.getposition.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class GetPositionDAOMybatis implements GetPositionDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.position.";
	
	@Override
	public int insertGetPositionSuggest(GetPositionsuggestVO vo) {
		return sqlSession.insert(namespace+"insertGetPositionSuggest", vo);
	}

	@Override
	public int updateReadCount(int positionsuggestNo) {
		return sqlSession.update(namespace+"updateReadCount", positionsuggestNo);
	}

	@Override
	public int deleteGetPSG(int positionsuggestNo) {
		return sqlSession.update(namespace+"deleteGetPSG", positionsuggestNo);
	}
}
