package com.it.workit.position.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Repository
public class PositionDAOMybatis implements PositionDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.position.";

	@Override
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(IndivpagingVO vo) {
		return sqlSession.selectList(namespace+"selectPositionFlag2ByUserno",vo);
	}

	@Override
	public int positionGetTotalRecord(IndivpagingVO vo) {
		return sqlSession.selectOne(namespace+"positionGetTotalRecord",vo);
	}

	@Override
	public int insertPositionSuggest(PositionsuggestVO vo) {
		return sqlSession.insert(namespace+"insertPositionSuggest", vo);
	}

	@Override
	public PositionsuggestVO selectPositionJustNow(int userNo) {
		return sqlSession.selectOne(namespace+"selectPositionJustNow", userNo);
	}

	@Override
	public List<Map<String, Object>> selectPositionSuggest(int userNo) {
		return sqlSession.selectList(namespace+"selectPositionSuggest", userNo);
	}
	
	@Override
	public List<Map<String, Object>> selectPositionForm(int userNo) {
		return sqlSession.selectList(namespace+"selectPositionForm", userNo);
	}
	
}
