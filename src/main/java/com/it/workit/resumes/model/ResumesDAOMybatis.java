package com.it.workit.resumes.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumesDAOMybatis implements ResumesDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.resumes.";
	@Override
	public List<ResumesAllVO> searchResumeByNo(int resumeNo) {
		return sqlSession.selectList(namespace+"searchResumeByNo", resumeNo);
	}
	
}
