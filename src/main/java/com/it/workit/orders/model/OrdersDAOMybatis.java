package com.it.workit.orders.model;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OrdersDAOMybatis implements OrdersDAO{

	@Autowired SqlSession sqlSession;
	
	String namespace="config.mybatis.mapper.oracle.orders.";
}
