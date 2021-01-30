package com.it.workit.orders.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired OrdersDAO ordersDao;

	@Override
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo) {
		return ordersDao.selectIndivPaymentByUserno(vo);
	}

	@Override
	public int ordersGetTotalRecord(IndivpagingVO vo) {
		return ordersDao.ordersGetTotalRecord(vo);
	}

	@Override
	public int insertOrderWithCoupon(OrdersVO vo) {
		int cnt = ordersDao.insertOrderWithCoupon(vo);
		return cnt;
	}
	
	@Override
	public int insertOrder(OrdersVO vo) {
		int cnt = ordersDao.insertOrder(vo);
		return cnt;
	}
	
}
