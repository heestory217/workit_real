package com.it.workit.orders.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.it.workit.companyMypage.model.CompanypagingVO;
import com.it.workit.indivMypage.model.IndivpagingVO;

public interface OrdersService {
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo);
	public int ordersGetTotalRecord(IndivpagingVO vo);
	
	//주문
	int insertOrderWithCoupon(OrdersVO vo);
	int insertOrder(OrdersVO vo);
	
	//주문  - 기업후기삭제
	int insertOrderWithCoupon(OrdersVO vo, OrderDetailDelRvVO rvVo);
	int insertOrder(OrdersVO vo, OrderDetailDelRvVO rvVo);

	//주문완료페이지
	List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo);
	Map<String, Object> selectOrderdetailsDelRVView(int orderNo);
	
	OrdersVO selectOrdersByOrderNo(int orderNo);
	List<Integer> selectPurchasedResumeNo(int userNo);
	
	public List<Date> selectorderscall(int userNo);
	
	public List<OrdersVO> selectCompanyPaymentByUserno(CompanypagingVO vo);
	public int ordersGetTotalRecords(CompanypagingVO vo);
}
