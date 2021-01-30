package com.it.workit.paidService.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.coupon.model.CouponService;
import com.it.workit.coupon.model.CouponVO;
import com.it.workit.message.controller.MessageController;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.orders.model.OrdersVO;
import com.it.workit.shoppingCart.model.ShoppingCartService;
import com.it.workit.users.model.UsersService;

@Controller
@RequestMapping("/shop")
public class PaidServiceController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	@Autowired private ShoppingCartService cartService;
	@Autowired private CouponService couponService;
	@Autowired private OrdersService ordersService;
	@Autowired private UsersService usersService;
	
	@ResponseBody
	@RequestMapping("/order.do")
	public int order(@ModelAttribute OrdersVO vo, 
			@RequestParam (required = false) String couponName,
			HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("주문/결제 userNo={}", userNo);
		logger.info("OrdersVO vo={}", vo);
		
		//[1] 주문 테이블 insert
		//[1-1] 쿠폰 여부 조회하기
		int cnt=0;
		if(couponName!=null && !couponName.isEmpty()) {
			//쿠폰이 있는 경우 조회해서 입력
			CouponVO couponVo = couponService.selectCoupon(couponName);
			int couponNo = couponVo.getCouponNo();
			vo.setCouponNo(couponNo);
			
			cnt = ordersService.insertOrderWithCoupon(vo);
		}else {	
			//쿠폰이 없는경우
			cnt = ordersService.insertOrder(vo);
		}
		
		logger.info("주문테이블 insert cnt="+cnt);
		
		//주문 테이블에 정상적으로 insert 되었다면
		//[2] ORDERDETAILRESUME 디테일에 정보 넣기
		if(cnt>0) {
			vo.getOrderNo();
			
		}
		
		
	    //[3] 장바구니 내역 지우기
		cnt = cartService.clearCart(userNo);
		logger.info("cnt="+cnt);
		
		return cnt;
	}
	
	@RequestMapping("/paymentComplete.do")
	public void paymentComplete() {}
}
