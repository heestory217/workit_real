package com.it.workit.corp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SubTopController {
	private static final Logger logger
	=LoggerFactory.getLogger(SubTopController.class);
	
	@RequestMapping("/company/subTop.do")
	public void companySubtop() {
		logger.info("기업 서브탑 보여주기");
	}
	
	@RequestMapping("/indiv/subTop.do")
	public void indivSubtop() {
		logger.info("개인 서브탑 보여주기");
	}
}
