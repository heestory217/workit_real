package com.it.workit.coupon.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.coupon.model.CouponService;
import com.it.workit.coupon.model.CouponVO;

@Controller
@RequestMapping("/admin/paidService/coupon")
public class AdminCouponController {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminCouponController.class);
	@Autowired private CouponService couponService;
	
	@RequestMapping("/manage.do")
	public String manage(Model model) {
		logger.info("관리자 - 쿠폰 관리 페이지");
		List<CouponVO> list = couponService.selectAll();
		model.addAttribute("list", list);
		return "admin/paidService/coupon/manage";
	}
	
}
