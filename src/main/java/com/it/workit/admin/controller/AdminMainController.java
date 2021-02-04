package com.it.workit.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminMainController {
	private Logger logger = LoggerFactory.getLogger(AdminMainController.class);
	
	@RequestMapping("/adminMain.do")
	public void adminMain() {
		logger.info("admin메인 화면");
	}
}
