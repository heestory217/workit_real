package com.it.workit.shoppingCart.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShoppingCartDAOMybatis implements ShoppingCartDAO {
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace = "config.mybatis.mapper.oracle.cart.";
	
	@Override
	public int insertCart(ShoppingCartVO vo) {
		return sqlSession.insert(namespace+"insertCart", vo);
	}

	@Override
	public List<Map<String, Object>> selectCartList(int userNo) {
		return sqlSession.selectList(namespace+"selectCartList", userNo);
	}

	@Override
	public int deleteOne(int shoppingcartNo) {
		return sqlSession.delete(namespace+"deleteOne",shoppingcartNo);
	}

	@Override
	public int clearCart(int userNo) {
		return sqlSession.delete(namespace+"clearCart",userNo);
	}
}
