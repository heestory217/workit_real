package com.it.workit.admin.indivUsers.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/indivUsers")
public class AdminIndivUsersController {
	private Logger logger=LoggerFactory.getLogger(AdminIndivUsersController.class);
	
	@RequestMapping("/selectIndivUsers.do")
	public String selectIndivUsers() {
		logger.info("관리자 - 개인 회원 조회 View");
		
		return "admin/indivUsers/selectIndivUsers";
	}
}
