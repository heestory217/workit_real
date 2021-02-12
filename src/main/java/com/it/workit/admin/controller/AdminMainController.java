package com.it.workit.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.admin.website.model.WebsiteManageService;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.users.model.UsersService;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	private Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@Autowired private WebsiteManageService manageService;
	@Autowired private UsersService usersService;
	@Autowired private OrdersService ordersService;
	
	@RequestMapping("/adminMain.do")
	public void adminMain(Model model) {
		logger.info("admin메인 화면");
		
		int totalVisitor=manageService.selectTotalVisitor();
		logger.info("총 방문자 수 ={}",totalVisitor);
		
		int totalIndivUsers=usersService.selectTotalIndivUsers();
		logger.info("총 개인 유저 수 ={}",totalIndivUsers);
		
		int totalCorpUsers=usersService.selectTotalCorpUsers();
		logger.info("총 기업 유저 수 ={}",totalCorpUsers);
		
		int totalIndivWithdrawUsers=usersService.selectTotalIndivWithdrawUsers();
		logger.info("총 개인 탈퇴 수 ={}",totalIndivWithdrawUsers);
		
		int totalCorpWithdrawUsers=usersService.selectTotalCorpWithdrawUsers();
		logger.info("총 기업 탈퇴 수 ={}",totalCorpWithdrawUsers);
		
		int totalPay=ordersService.totalPay();
		logger.info("총 결제 금액 ={}",totalPay);
		
		model.addAttribute("totalVisitor", totalVisitor);
		model.addAttribute("totalIndivUsers", totalIndivUsers);
		model.addAttribute("totalCorpUsers", totalCorpUsers);
		model.addAttribute("totalIndivWithdrawUsers", totalIndivWithdrawUsers);
		model.addAttribute("totalCorpWithdrawUsers", totalCorpWithdrawUsers);
		model.addAttribute("totalPay", totalPay);
	}
}
