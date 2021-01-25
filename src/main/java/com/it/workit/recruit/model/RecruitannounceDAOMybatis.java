package com.it.workit.recruit.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecruitannounceDAOMybatis implements RecruitannounceDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.recruitannounce.";

	@Override
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo) {
		RecruitannounceVO vo = sqlSession.selectOne(namespace+"recruitannouncedetail", recruitannounceNo);
		return vo;
	}	
}