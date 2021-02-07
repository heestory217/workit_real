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
	
}
