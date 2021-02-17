package com.it.workit.orders.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;
import com.it.workit.companyMypage.model.CompanypagingVO;
import com.it.workit.hrm.model.HrmResumePageVO;
import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.shoppingCart.model.ShoppingCartVO;

public interface OrdersService {
	public List<OrdersVO> selectIndivPaymentByUserno(IndivpagingVO vo);
	public int ordersGetTotalRecord(IndivpagingVO vo);

	//주문 - 이력서
	int insertOrderWithCoupon(OrdersVO vo);
	int insertOrder(OrdersVO vo);

	//주문  - 기업후기삭제
	int insertOrderWithCoupon(OrdersVO vo, OrderDetailDelRvVO rvVo);
	int insertOrder(OrdersVO vo, OrderDetailDelRvVO rvVo);

	//주문  - 채용공고 광고
	int insertOrderWithCoupon(OrdersVO vo, OrderDetailAdVO adVo);
	int insertOrder(OrdersVO vo, OrderDetailAdVO adVo);
	
	//주문  - 후기 열람권
	int insertOrderWithCoupon(OrdersVO vo, OrderDetailSeeVO seeVo);
	int insertOrder(OrdersVO vo, OrderDetailSeeVO seeVo);

	//주문완료페이지
	List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo);
	Map<String, Object> selectOrderdetailsDelRVView(int orderNo);
	Map<String, Object> selectOrderdetailsADView(int orderNo);
	Map<String, Object> selectOrderdetailsSeeView(int orderNo);

	OrdersVO selectOrdersByOrderNo(int orderNo);

	List<Map<String, Object>> selectPurchasedResume(HrmResumePageVO vo);
	int selectTotalResumeRecord(HrmResumePageVO vo);

	public List<Date> selectorderscall(int userNo);

	public List<OrdersCorpPayVO> selectCompanyPaymentByUserno(CompanypagingVO vo);
	public int ordersGetTotalRecords(CompanypagingVO vo);

	//구매한 이력서 리스트
	List<Map<String, Object>> selectPurchasedResume(int userNo);
	public int selectPurchasedResumeCount(ShoppingCartVO vo);

	//어드민 구매내역 조회
	public List<OrdersCorpPayVO> selectCompanyPaymentByUserno(int userNo);

	public int totalPay();
	
	public List<OrdersCorpPayVO> fullorderlist(SearchVO searchVo);
	public int fullorderlistcount(SearchVO searchVo);
}
