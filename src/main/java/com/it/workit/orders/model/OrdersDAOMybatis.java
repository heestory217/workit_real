package com.it.workit.orders.model;

import java.util.List;
import java.util.Map;

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
	
	
	//주문하기
	@Override
	public int insertOrderWithCoupon(OrdersVO vo) {
		return sqlSession.insert(namespace+"insertOrderWithCoupon", vo);
	}
	
	@Override
	public int insertOrder(OrdersVO vo) {
		return sqlSession.insert(namespace+"insertOrder", vo);
	}

	@Override
	public int insertOrderDetailResume(OrdersVO vo) {
		return sqlSession.update(namespace+"insertOrderDetailResume", vo);
	}

	//기업후기 삭제 주문상세 INSERT
	@Override
	public int insertOrderDetailDelReview(OrderDetailDelRvVO vo) {
		return sqlSession.insert(namespace+"insertOrderDetailDelReview", vo);
	}
	
	//주문완료페이지 - 이력서
	@Override
	public List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo) {
		return sqlSession.selectList(namespace+"selectOrderdetailsResumeView", orderNo);
	}

	//주문완료페이지 - 기업후기 삭제
	@Override
	public Map<String, Object> selectOrderdetailsDelRVView(int orderNo) {
		return sqlSession.selectOne(namespace+"selectOrderdetailsDelRVView", orderNo);
	}
	
	@Override
	public OrdersVO selectOrdersByOrderNo(int orderNo) {
		return sqlSession.selectOne(namespace+"selectOrdersByOrderNo", orderNo);
	}

	//구입한 이력서 번호 리스트
	@Override
	public List<Map<String, Object>> selectPurchasedResume(int userNo) {
		return sqlSession.selectList(namespace+"selectPurchasedResume", userNo);
	}

	@Override
	public int updateResumeRead(OrderDetailResumeVO vo) {
		return sqlSession.update(namespace+"updateResumeRead", vo);
	}

}
