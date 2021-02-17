package com.it.workit.admin.orderslist.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.orders.model.OrdersCorpPayVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.recruit.model.AdminadvertisingVO;
import com.it.workit.recruit.model.RecruitannounceVO;

@Controller
@RequestMapping("/admin/paidService/orderslist")
public class OrderslistController {
	private static final Logger logger=LoggerFactory.getLogger(OrderslistController.class);
	
	@Autowired private OrdersService ordersService;
	
	@RequestMapping("/ordersList.do")
	public String recruitList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("주문서 목록");
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
				
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
				
		int totalRecord=ordersService.fullorderlistcount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		List<OrdersCorpPayVO> list=ordersService.fullorderlist(searchVo);
				
		logger.info("list.size={}",list.size());
		logger.info("list={}",list.get(2));
		model.addAttribute("list", list);

		return "/admin/paidService/orderslist/ordersList";
	}
}
