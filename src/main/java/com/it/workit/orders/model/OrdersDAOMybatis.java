package com.it.workit.orders.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Repository
public class OrdersDAOMybatis implements OrdersDAO{

	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.orders.";

	@Override
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo) {
		return sqlSession.selectList(namespace+"selectIndivPaymentByUserno",vo);
	}

	@Override
	public int ordersGetTotalRecord(IndivpagingVO vo) {
		return sqlSession.selectOne(namespace+"ordersGetTotalRecord", vo);
	}

	@Override
	public int insertOrderWithCoupon(OrdersVO vo) {
		return sqlSession.insert(namespace+"insertOrderWithCoupon", vo);
	}
	
	@Override
	public int insertOrder(OrdersVO vo) {
		return sqlSession.insert(namespace+"insertOrder", vo);
	}

}
