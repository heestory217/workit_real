package com.it.workit.admin.resumeManager.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/users/resume")
public class resumeManagerController {
	private static final Logger logger
		=LoggerFactory.getLogger(resumeManagerController.class);
	
	@RequestMapping("/resumeManager.do")
	public void resumeManager() {
		logger.info("이력서관리자 화면처리");
	}
}
