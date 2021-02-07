package com.it.workit.orders.model;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.workit.companyMypage.model.CompanypagingVO;
import com.it.workit.hrm.model.HrmResumePageVO;
import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.review.model.ReviewDAO;
import com.it.workit.shoppingCart.model.ShoppingCartDAO;

@Service
public class OrdersServiceImpl implements OrdersService{
	@Autowired OrdersDAO ordersDao;
	@Autowired ShoppingCartDAO cartDao;
	@Autowired ReviewDAO reDao;

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

	//기업후기 삭제 쿠폰
	@Override
	@Transactional
	public int insertOrderWithCoupon(OrdersVO vo, OrderDetailDelRvVO rvVo) {
		int cnt = ordersDao.insertOrderWithCoupon(vo);
		rvVo.setOrderNo(vo.getOrderNo());
		cnt = ordersDao.insertOrderDetailDelReview(rvVo);
		cnt = reDao.updateDeleteCheck(rvVo.getCorpreviewNo());	//결제하면 후기삭제 여부 업데이트
		return cnt;
	}

	//기업후기 삭제 쿠폰없음
	@Override
	@Transactional
	public int insertOrder(OrdersVO vo, OrderDetailDelRvVO rvVo) {
		int cnt = ordersDao.insertOrder(vo);
		rvVo.setOrderNo(vo.getOrderNo());
		cnt = ordersDao.insertOrderDetailDelReview(rvVo);
		cnt = reDao.updateDeleteCheck(rvVo.getCorpreviewNo());	//결제하면 후기삭제 여부 업데이트
		return cnt;
	}
	
	//채용공고 광고 쿠폰
	@Override
	@Transactional
	public int insertOrderWithCoupon(OrdersVO vo, OrderDetailAdVO adVo) {
		int cnt = ordersDao.insertOrderWithCoupon(vo);
		adVo.setOrderNo(vo.getOrderNo());
		cnt = ordersDao.insertOrderDetailAD(adVo);
		return cnt;
	}
	
	//채용공고 광고 쿠폰없음
	@Override
	@Transactional
	public int insertOrder(OrdersVO vo, OrderDetailAdVO adVo) {
		int cnt = ordersDao.insertOrder(vo);
		adVo.setOrderNo(vo.getOrderNo());
		cnt = ordersDao.insertOrderDetailAD(adVo);
		return cnt;
	}

	//주문완료 - 이력서
	@Override
	public List<Map<String, Object>> selectOrderdetailsResumeView(int orderNo) {
		return ordersDao.selectOrderdetailsResumeView(orderNo);
	}

	//주문완료 - 기업후기
	@Override
	public Map<String, Object> selectOrderdetailsDelRVView(int orderNo) {
		return ordersDao.selectOrderdetailsDelRVView(orderNo);
	}
	
	//주문완료 - 광고
	@Override
	public Map<String, Object> selectOrderdetailsADView(int orderNo) {
		return ordersDao.selectOrderdetailsADView(orderNo);
	}

	@Override
	public OrdersVO selectOrdersByOrderNo(int orderNo) {
		return ordersDao.selectOrdersByOrderNo(orderNo);
	}

	@Override
	public List<Map<String, Object>> selectPurchasedResume(HrmResumePageVO vo) {
		return ordersDao.selectPurchasedResume(vo);
	}

	@Override
	public int selectTotalResumeRecord(HrmResumePageVO vo) {
		return ordersDao.selectTotalResumeRecord(vo);
	}

	@Override
	public List<Date> selectorderscall(int userNo) {
		return ordersDao.selectorderscall(userNo);
	}

	@Override
	public List<OrdersCorpPayVO> selectCompanyPaymentByUserno(CompanypagingVO vo) {
		return ordersDao.selectCompanyPaymentByUserno(vo);
	}

	@Override
	public int ordersGetTotalRecords(CompanypagingVO vo) {
		return ordersDao.ordersGetTotalRecords(vo);
	}


}
