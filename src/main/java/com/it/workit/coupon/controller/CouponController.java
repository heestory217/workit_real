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
@RequestMapping("/coupon")
public class CouponController {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	@Autowired private CouponService couponService;
	
	@ResponseBody
	@RequestMapping("/couponApply.do")
	public int couponApply(@RequestParam String couponName) {
		logger.info("쿠폰 적용하기, couponName={}", couponName);
		
		CouponVO vo = couponService.selectCoupon(couponName);
		int couponRate = vo.getCouponRate();
		logger.info("쿠폰 조회 결과 couponRate={}", couponRate);
		
		return couponRate;
	}
}
