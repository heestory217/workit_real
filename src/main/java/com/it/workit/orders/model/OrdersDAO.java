package com.it.workit.orders.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.resumes.model.ResumesVO;

public interface OrdersDAO {
	//개인 마이페이지 사용
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
	
	//구매이력서 리스트
	List<Map<String, Object>> selectPurchasedResume(int userNo);
	//구매 이력서 읽음처리 업데이트
	int updateResumeRead(OrderDetailResumeVO vo);
	
}
