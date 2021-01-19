package com.it.workit.faq.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOMybatis implements FaqDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace = "config.mybatis.mapper.oracle.faq.";
	
	@Override
	public List<FaqVO> faqselectAll() {
		List<FaqVO> list = sqlSession.selectList(namespace+"faqselectAll");
		return list;
	}

	@Override
	public int faqinsert(FaqVO faqVo) {
		return sqlSession.insert(namespace+"faqinsert",faqVo);
	}

}
