package com.it.workit.admin.salesMngModel;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class salesMngDAOMybatis implements salesMngDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "com.mybatis.mapper.salesMng.";
	
	@Override
	public List<Map<String, Object>> selectMonthSales(salesDateVO vo) {
		return sqlSession.selectList(namespace+"selectMonthSales", vo);
	}

	@Override
	public List<Map<String, Object>> selectReviewSales(salesDateVO vo) {
		return sqlSession.selectList(namespace+"selectReviewSales", vo);
	}

	@Override
	public List<Map<String, Object>> selectAdSales(salesDateVO vo) {
		return sqlSession.selectList(namespace+"selectAdSales", vo);
	}

	@Override
	public List<Map<String, Object>> selectDelSales(salesDateVO vo) {
		return sqlSession.selectList(namespace+"selectDelSales", vo);
	}

	@Override
	public List<Map<String, Object>> selectResumeSales(salesDateVO vo) {
		return sqlSession.selectList(namespace+"selectResumeSales", vo);
	}
	
}
