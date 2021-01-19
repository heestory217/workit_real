package com.it.workit.corp.model;

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
	
	public CorpVO selectCorp(int corpNo) {
		return sqlSession.selectOne(namespace+"selectcorp", corpNo);
	}

}
