package com.it.workit.corp.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CorpDAOMybatis implements CorpDAO {
	@Autowired SqlSession sqlSession;
	
	private String namespace="com.mybatis.mapper.corp.";
	
	public int insertCorp(CorpVO vo) {
		return sqlSession.insert(namespace+"insertCorp", vo);
	}

	public int insertImg(CorpimgVO vo) {
		return sqlSession.update(namespace+"insertImg", vo);
	}
	
	public CorpAllVO selectCorp(int corpNo) {
		return sqlSession.selectOne(namespace+"selectCorp", corpNo);
	}
	
	public List<CorpimgVO> corpImgList (int corpNo) {
		return sqlSession.selectList(namespace+"corpImgList", corpNo);
	}

	@Override
	public List<CorpRecruitViewVO> selectRecruit(int userNo) {
		return sqlSession.selectList(namespace+"selectRecruit", userNo);
	}

}
