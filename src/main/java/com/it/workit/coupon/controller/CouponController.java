package com.it.workit.coupon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.coupon.model.CouponService;

@Controller
@RequestMapping("/coupon")
public class CouponController {
	
	private static final Logger logger = LoggerFactory.getLogger(CouponController.class);
	@Autowired private CouponService couponService;
	
}
