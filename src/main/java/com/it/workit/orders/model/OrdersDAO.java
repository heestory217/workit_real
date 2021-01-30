package com.it.workit.orders.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface OrdersDAO {
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo);
	public int ordersGetTotalRecord(IndivpagingVO vo);
	
	int insertOrderWithCoupon(OrdersVO vo);
	int insertOrder(OrdersVO vo);
	int insertOrderDetailResume(OrdersVO vo);
	List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo);
	
	OrdersVO selectOrdersByOrderNo(int orderNo);
}
