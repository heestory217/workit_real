package com.it.workit.coupon.controller;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;

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
	
	@RequestMapping("/insert.do")
	public String insert(@ModelAttribute CouponVO vo, 
			@RequestParam String start, @RequestParam String end, Model model) {
		logger.info("쿠폰 등록하기 CouponVO={}", vo);
		logger.info("start={} end={}", start, end);
		
		start += " 00:00:00.0";
		end += " 00:00:00.0";
		logger.info("start={} end={}", start, end);
		
		java.sql.Timestamp couponStartdate = java.sql.Timestamp.valueOf(start);
		java.sql.Timestamp couponEnddate = java.sql.Timestamp.valueOf(end);
		
		vo.setCouponStartdate(couponStartdate);
		vo.setCouponEnddate(couponEnddate);
		
		int cnt = couponService.insertCoupon(vo);
		
		String msg = "쿠폰등록에 실패하였습니다.", url="/admin/paidService/coupon/manage.do";
		if(cnt>0) {
			msg="쿠폰을 성공적으로 등록하였습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@RequestMapping("/showInfo.do")
	public CouponVO showInfo(@RequestParam (defaultValue = "0") int couponNo) {
		CouponVO vo= couponService.selectCouponByNo(couponNo);
		return vo;
	}
	
	@RequestMapping("/update.do")
	public void update(@ModelAttribute CouponVO vo) {
		logger.info("쿠폰 수정하기 CouponVO={}", vo);
	}
	
}
