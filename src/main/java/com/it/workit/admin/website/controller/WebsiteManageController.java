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
@RequestMapping("/website")
public class WebsiteManageController {
	private static final Logger logger = LoggerFactory.getLogger(WebsiteManageController.class);
	@Autowired private WebsiteManageService websiteService;
	
	@RequestMapping("/termsOfService.do")
	public void termsOfService(Model model) {
		logger.info("이용약관 페이지 보여주기");
		Map<String, Object> map = websiteService.selectWebsiteManage("T");
		model.addAttribute("map", map);
	}
	
	@RequestMapping("/privacyPolicy.do")
	public void privacyPolicy(Model model) {
		logger.info("개인정보처리방침 페이지 보여주기");
		Map<String, Object> map = websiteService.selectWebsiteManage("P");
		model.addAttribute("map", map);
	}
}
