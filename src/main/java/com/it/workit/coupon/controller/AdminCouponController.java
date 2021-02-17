package com.it.workit.coupon.controller;

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
		end += " 23:59:59.0";
		
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
	
	@RequestMapping("/updateForm.do")
	public void updateForm(@RequestParam (defaultValue = "0") int couponNo, Model model) {
		logger.info("쿠폰 수정하기");
		CouponVO vo= couponService.selectCouponByNo(couponNo);
		
		java.sql.Timestamp start = vo.getCouponStartdate();
		java.sql.Timestamp  end = vo.getCouponEnddate();
		
		java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("yyyy-MM-dd");
		String couponStartdate = sdf.format(start);
		String couponEnddate = sdf.format(end);
		logger.info("couponStartdate={}, couponEnddate={}", couponStartdate, couponEnddate);
		
		model.addAttribute("vo", vo);
		model.addAttribute("couponStartdate", couponStartdate);
		model.addAttribute("couponEnddate", couponEnddate);
	}
	
	@ResponseBody
	@RequestMapping("/update.do")
	public int update(@ModelAttribute CouponVO vo, @RequestParam String start, @RequestParam String end) {
		logger.info("쿠폰 수정처리 CouponVO={}", vo);
		logger.info("start={} end={}", start, end);
		
		start += " 00:00:00.0";
		end += " 23:59:59.0";
		
		logger.info("start={} end={}", start, end);
		
		java.sql.Timestamp couponStartdate = java.sql.Timestamp.valueOf(start);
		java.sql.Timestamp couponEnddate = java.sql.Timestamp.valueOf(end);
		
		vo.setCouponStartdate(couponStartdate);
		vo.setCouponEnddate(couponEnddate);
		
		int cnt = couponService.updateCoupon(vo);
		return cnt;
	}
	
}
