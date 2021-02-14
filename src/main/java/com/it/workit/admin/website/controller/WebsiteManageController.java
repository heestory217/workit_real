package com.it.workit.admin.website.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/website")
public class WebsiteManageController {
	private static final Logger logger = LoggerFactory.getLogger(WebsiteManageController.class);
	
	@RequestMapping("/siteIntro.do")
	public void siteIntro() {
		logger.info("사이트소개 페이지 보여주기");
	}
			
	@RequestMapping("/termsOfService.do")
	public void termsOfService() {
		logger.info("이용약관 페이지 보여주기");
		
	}
	
	@RequestMapping("/privacyPolicy.do")
	public void privacyPolicy() {
		logger.info("개인정보처리방침 페이지 보여주기");
		
	}
}
