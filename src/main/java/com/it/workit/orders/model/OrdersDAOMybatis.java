package com.it.workit.orders.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDAOMybatis implements OrdersDAO{

	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.orders.";

	@Override
	public List<OrdersVO> selectIndivPaymentByUserno(int userNo) {
		return sqlSession.selectList(namespace+"selectIndivPaymentByUserno",userNo);
	}
}
