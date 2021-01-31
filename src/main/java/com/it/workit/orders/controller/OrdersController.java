package com.it.workit.orders.controller;

import java.util.List;
import java.util.Map;

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
import com.it.workit.orders.model.OrdersService;
import com.it.workit.orders.model.OrdersVO;

@Controller
@RequestMapping("/shop")
public class OrdersController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);
	@Autowired private CouponService couponService;
	@Autowired private OrdersService ordersService;
	
	@ResponseBody
	@RequestMapping("/order.do")
	public int order(@ModelAttribute OrdersVO vo, 
			@RequestParam (required = false) String couponName,
			HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("주문/결제 userNo={}", userNo);
		
		vo.setUserNo(userNo);
		logger.info("OrdersVO vo={}", vo);
		
		//[1] 주문 테이블 insert
		int cnt=0;
		//[1-1] 쿠폰 여부 조회하기
		if(couponName!=null && !couponName.isEmpty()) {
			//쿠폰이 있는 경우 조회해서 입력
			CouponVO couponVo = couponService.selectCoupon(couponName);
			int couponNo = couponVo.getCouponNo();
			vo.setCouponNo(couponNo);
			logger.info("쿠폰이 있는 경우, OrdersVO vo={}", vo);
			
			cnt = ordersService.insertOrderWithCoupon(vo);
		}else {	
			//쿠폰이 없는경우
			cnt = ordersService.insertOrder(vo);
		}
		
		logger.info("주문테이블 insert cnt="+cnt);
		logger.info("insert 이후, OrdersVO vo={}", vo);
		
		//주문완료 페이지로 넘겨주기 위한 orderNo 전달
		int orderNo = vo.getOrderNo();
		logger.info("orderNo", orderNo);
		
		return orderNo;
	}
	
	@RequestMapping("/paymentComplete.do")
	public String paymentComplete(@RequestParam (defaultValue = "0" ) int orderNo, Model model) {
		logger.info("주문 완료 내역 보여주기, orderNo={}", orderNo);
		
		List<Map<String, Object>> list = ordersService.selectOrderdetailsResumeView(orderNo);
		logger.info("주문 내역 list.size={}", list.size());
		
		OrdersVO ordersVo = ordersService.selectOrdersByOrderNo(orderNo);
		logger.info("주문 ordersVo={}", ordersVo);
		
		model.addAttribute("list", list);
		model.addAttribute("ordersVo", ordersVo);
		
		return "shop/paymentComplete";
	}

}
