package com.it.workit.language.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LanguageDAOMybatis implements LanguageDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.language.";
	@Override
	public List<LanguageVO> selectAllLang() {
		return sqlSession.selectList(namespace+"selectAllLang");
	}
}
