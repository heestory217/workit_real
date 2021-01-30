package com.it.workit.orders.model;

import java.util.List;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface OrdersService {
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo);
	public int ordersGetTotalRecord(IndivpagingVO vo);
	int insertOrderWithCoupon(OrdersVO vo);
	int insertOrder(OrdersVO vo);
	
}
