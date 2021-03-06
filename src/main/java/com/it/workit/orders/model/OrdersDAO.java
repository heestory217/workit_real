package com.it.workit.orders.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;
import com.it.workit.companyMypage.model.CompanypagingVO;
import com.it.workit.hrm.model.HrmResumePageVO;
import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.shoppingCart.model.ShoppingCartVO;

public interface OrdersDAO {
	//개인 마이페이지 사용
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo);
	public int ordersGetTotalRecord(IndivpagingVO vo);

	//주문
	int insertOrderWithCoupon(OrdersVO vo);
	int insertOrder(OrdersVO vo);

	//주문상세 INSERT
	int insertOrderDetailResume(OrdersVO vo);
	int insertOrderDetailOneResume(OrderDetailResumeVO vo);
	int insertOrderDetailDelReview(OrderDetailDelRvVO vo);
	int insertOrderDetailAD(OrderDetailAdVO vo);
	int insertOrderDetailSeeRV(OrderDetailSeeVO vo);

	//주문완료 페이지
	List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo);
	Map<String, Object> selectOrderdetailsDelRVView(int orderNo);
	Map<String, Object> selectOrderdetailsADView(int orderNo);
	Map<String, Object> selectOrderdetailsSeeView(int orderNo);

	OrdersVO selectOrdersByOrderNo(int orderNo);

	//구매이력서 리스트
	List<Map<String, Object>> selectPurchasedResume(HrmResumePageVO vo);
	int selectTotalResumeRecord(HrmResumePageVO vo);

	public List<Date> selectorderscall(int userNo);

	public List<OrdersCorpPayVO> selectCompanyPaymentByUserno(CompanypagingVO vo);
	public int ordersGetTotalRecords(CompanypagingVO vo);

	//구매이력 userNo검색
	public List<Map<String, Object>> selectPurchasedResume(int userNo);
	public int selectPurchasedResumeCount(ShoppingCartVO vo);

	public List<OrdersCorpPayVO> selectCompanyPaymentByUserno(int userNo);

	//은별, 관리자이용-총결제금액
	public int totalPay();
	
	public List<OrdersCorpPayVO> fullorderlist(SearchVO searchVo);
	public int fullorderlistcount(SearchVO searchVo);
}
