package com.it.workit.hrm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.orders.model.OrdersService;
import com.it.workit.resumes.model.ResumesAllVO;
import com.it.workit.resumes.model.ResumesService;

@Controller
@RequestMapping("/company/humanResourceManagement")
public class HrmController {
	
	private static final Logger logger = LoggerFactory.getLogger(HrmController.class);
	@Autowired private OrdersService ordersService;
	@Autowired private ResumesService resumesService;
	
	@RequestMapping("/purchasedResumes.do")
	public String purchasedResumes(HttpSession session, Model model) {
		logger.info("구매 이력서 페이지");
		int userNo = (Integer) session.getAttribute("userNo");
		
		//map에 담긴건 이력서 번호
		List<Integer> resumeNoList = ordersService.selectPurchasedResumeNo(userNo);
		
		/*
		//이력서 번호로 조회한 이력서 전체 모음
		List<ResumesAllVO>  allResumeList = resumesService.searchResumeByNo(resumeNoList);
		model.addAttribute("allResumeList", allResumeList);
		*/
		return "company/humanResourceManagement/purchasedResumes";
	}
	
	@RequestMapping("/positionSuggest.do")
	public void positionSuggest() {
	}

}
