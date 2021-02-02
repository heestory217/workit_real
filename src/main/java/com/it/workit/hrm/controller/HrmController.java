package com.it.workit.hrm.controller;

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

import com.it.workit.orders.model.OrderDetailResumeVO;
import com.it.workit.orders.model.OrdersService;

@Controller
@RequestMapping("/company/HRManagment")
public class HrmController {
	
	private static final Logger logger = LoggerFactory.getLogger(HrmController.class);
	@Autowired private OrdersService ordersService;
	//@Autowired private ResumesService resumesService;
	
	@RequestMapping("/purchasedResumes.do")
	public String purchasedResumes(HttpSession session, Model model) {
		logger.info("구매 이력서 페이지");
		int userNo = (Integer) session.getAttribute("userNo");
		
		//map에 담긴건 이력서 번호
		List<Map<String, Object>> resumeList = ordersService.selectPurchasedResume(userNo);
		model.addAttribute("resumeList", resumeList);
		
		return "company/HRManagment/purchasedResumes";
	}
	
	@RequestMapping("/ResumeCountUpdate.do")
	public String ResumeCountUpdate(@ModelAttribute OrderDetailResumeVO vo){
		logger.info("이력서 열람여부 업데이트");
		logger.info("OrderDetailResumeVO vo={}", vo);
		
		int cnt = ordersService.updateResumeRead(vo);
		logger.info("이력서 열람! cnt={}", cnt);
		
		//이력서 상세 페이지로 리다이렉트 (수정하기)
		return "redirect:/company/HRManagment/purchasedResumes.do";
	}
	
	@RequestMapping("/positionSuggest.do")
	public void positionSuggest() {
	}

}
