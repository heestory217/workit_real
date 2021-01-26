package com.it.workit.recruit.model;

import java.util.List;

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

	@Override
	public String recruitcorpwantwork(int recruitannounceNo) {
		String rc= sqlSession.selectOne(namespace+"recruitcorpwantwork", recruitannounceNo);
		return rc;
	}
	
	@Override
	public String recruitcorpwantedarea(int recruitannounceNo) {
		String vo= sqlSession.selectOne(namespace+"recruitcorpwantedarea1", recruitannounceNo)+" "+sqlSession.selectOne(namespace+"recruitcorpwantedarea2", recruitannounceNo);
		return vo;
	}

	@Override
	public List<RecruitannounceVO> selectRecruitList(int userNo) {
		return sqlSession.selectList(namespace+"selectRecruitList", userNo);
	}

}