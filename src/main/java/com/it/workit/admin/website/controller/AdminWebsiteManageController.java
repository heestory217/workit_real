package com.it.workit.admin.website.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.admin.website.model.WebsiteManageService;

@Controller
@RequestMapping("/admin/siteManage")
public class AdminWebsiteManageController {
	private static final Logger logger = LoggerFactory.getLogger(AdminWebsiteManageController.class);
	@Autowired private WebsiteManageService websiteService;
	
	@RequestMapping("/siteIntro.do")
	public String siteIntro(Model model) {
		logger.info("사이트소개 페이지 보여주기");
		Map<String, Object> map = websiteService.selectSiteIntro();
		model.addAttribute("map", map);
		 
		return "admin/siteManage/siteIntro";
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
