package com.it.workit.orders.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.resumes.model.ResumesVO;

public interface OrdersDAO {
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo);
	public int ordersGetTotalRecord(IndivpagingVO vo);
	
	//주문
	int insertOrderWithCoupon(OrdersVO vo);
	int insertOrder(OrdersVO vo);
	
	//주문상세 INSERT 
	int insertOrderDetailResume(OrdersVO vo);
	int insertOrderDetailDelReview(OrderDetailDelRvVO vo);
	
	//주문완료 페이지
	List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo);
	Map<String, Object> selectOrderdetailsDelRVView(int orderNo);
	
	OrdersVO selectOrdersByOrderNo(int orderNo);
	List<Integer> selectPurchasedResumeNo(int userNo);
	
}
