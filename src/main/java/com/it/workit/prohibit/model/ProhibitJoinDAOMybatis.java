package com.it.workit.prohibit.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.applicant.model.CorpApplicantPagingVO;

@Repository
public class ProhibitJoinDAOMybatis implements ProhibitJoinDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.applicant.";
	
	@Override
	public int insertProhibit(ProhibitJoinVO vo) {
		return sqlSession.insert(namespace+"insertProhibit", vo);
	}

	@Override
	public int selectIfProhibited(int userIndivNo) {
		return sqlSession.selectOne(namespace+"selectIfProhibited", userIndivNo);
	}

	@Override
	public List<Map<String, Object>> selectProhibitedList(ProhibitJoinPagingVO vo) {
		return sqlSession.selectList(namespace+"selectProhibitedList", vo);
	}

	@Override
	public int deleteFromProhibit(int userIndivNo) {
		return sqlSession.delete(namespace+"deleteFromProhibit", userIndivNo);
	}

	@Override
	public int selectProhibitTotal(int userCorpNo) {
		return sqlSession.selectOne(namespace+"selectProhibitTotal", userCorpNo);
	}
	
}
