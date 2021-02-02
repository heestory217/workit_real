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
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.Utility;
import com.it.workit.hrm.model.HrmResumePageVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.review.model.ReviewVO;

@Controller
@RequestMapping("/company/HRManagment")
public class HrmController {
	
	private static final Logger logger = LoggerFactory.getLogger(HrmController.class);
	@Autowired private OrdersService ordersService;
	//@Autowired private ResumesService resumesService;
	
	@RequestMapping("/purchasedResumes.do")
	public String purchasedResumes(@ModelAttribute HrmResumePageVO searchVo, 
			@RequestParam (required = false) String searchPRKeyword,
			HttpSession session, Model model) {
		logger.info("구매 이력서 페이지");
		
		searchVo.setSearchKeyword(searchPRKeyword);
		logger.info("검색 키워드 : searchKeyword={}", searchPRKeyword);
		
		//키워드 조절
		if(searchPRKeyword.equals("신입")) {
			searchVo.setSearchKeyword("0");
		}else if(searchPRKeyword.lastIndexOf("년")>0) {
			int idx = searchPRKeyword.lastIndexOf("년");
			searchVo.setSearchKeyword(searchPRKeyword.substring(0, idx));
		}

		int userNo = (Integer) session.getAttribute("userNo");
		searchVo.setUserNo(userNo);
		
		//페이징
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		//구매한 이력서 리스트 
		List<Map<String, Object>> resumeList = ordersService.selectPurchasedResume(searchVo);
		logger.info("구매 이력서 list.size={}", resumeList.size());
		
		int totalRecord=ordersService.selectTotalResumeRecord(searchVo);
		logger.info("전체 구매 이력서 수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("resumeList", resumeList);
		
		return "company/HRManagment/purchasedResumes";
	}
	
	@RequestMapping("/positionSuggest.do")
	public void positionSuggest() {
		
	}

}
