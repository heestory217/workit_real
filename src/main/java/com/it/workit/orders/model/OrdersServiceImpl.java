package com.it.workit.orders.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.shoppingCart.model.ShoppingCartDAO;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired OrdersDAO ordersDao;
	@Autowired ShoppingCartDAO cartDao;

	@Override
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo) {
		return ordersDao.selectIndivPaymentByUserno(vo);
	}

	@Override
	public int ordersGetTotalRecord(IndivpagingVO vo) {
		return ordersDao.ordersGetTotalRecord(vo);
	}

	@Override
	@Transactional
	public int insertOrderWithCoupon(OrdersVO vo) {
		int cnt = ordersDao.insertOrderWithCoupon(vo);
		cnt = ordersDao.insertOrderDetailResume(vo);
		cnt = cartDao.clearCart(vo.getUserNo());
		return cnt;
	}
	
	@Override
	@Transactional
	public int insertOrder(OrdersVO vo) {
		int cnt = ordersDao.insertOrder(vo);
		cnt = ordersDao.insertOrderDetailResume(vo);
		cnt = cartDao.clearCart(vo.getUserNo());
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo) {
		return ordersDao.selectOrderdetailsResumeView(orderNo);
	}

	@Override
	public OrdersVO selectOrdersByOrderNo(int orderNo) {
		return ordersDao.selectOrdersByOrderNo(orderNo);
	}

	@Override
	public List<Integer> selectPurchasedResumeNo(int userNo) {
		return ordersDao.selectPurchasedResumeNo(userNo);
	}
	
}
