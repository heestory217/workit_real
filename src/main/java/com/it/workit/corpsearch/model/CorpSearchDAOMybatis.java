package com.it.workit.corpsearch.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;

@Repository
public class CorpSearchDAOMybatis implements CorpSearchDAO {

	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.corpsearch.";
	
	@Override
	public List<Integer> searchDefault(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"searchDefault",searchVo);
	}
	
}
