package com.it.workit.corpsearch.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;
import com.it.workit.resumes.model.ResumesAllVO;

@Repository
public class CorpSearchDAOMybatis implements CorpSearchDAO {

	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.corpsearch.";
	
	@Override
	public List<ResumesAllVO> searchDefault(CorpReSearchAllVO searchVo) {
		return sqlSession.selectList(namespace+"searchDefault",searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectTotalRecord", searchVo);
	}

	@Override
	public ResumesAllVO searchDefault(int resumeNO) {
		return sqlSession.selectOne(namespace+"searchResumeOne", resumeNO);
	}
	
}
