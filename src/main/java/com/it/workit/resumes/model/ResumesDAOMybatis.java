package com.it.workit.resumes.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumesDAOMybatis implements ResumesDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.resumes.";
	
	@Override
	public ResumesAllVO searchResumeByNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"searchResumeByNo", resumeNo);
	}
	
}
