package com.it.workit.coupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.coupon.model.CouponService;
import com.it.workit.coupon.model.CouponVO;

@Controller
@RequestMapping("/admin/paidService/coupon")
public class AdminCouponController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminCouponController.class);
	//@Autowired private CouponService couponService;
	
	@ResponseBody
	@RequestMapping("/couponMng.do")
	public void couponMng() {
		logger.info("관리자 - 쿠폰 관리 페이지");
	}
	
}
