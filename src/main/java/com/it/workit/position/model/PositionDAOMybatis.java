package com.it.workit.position.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PositionDAOMybatis implements PositionDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.position.";

	@Override
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(int userNo) {
		return sqlSession.selectList(namespace+"selectPositionFlag2ByUserno",userNo);
	}
}
