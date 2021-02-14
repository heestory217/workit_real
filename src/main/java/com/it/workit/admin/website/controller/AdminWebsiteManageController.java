package com.it.workit.admin.website.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.admin.website.model.WebsiteManageService;
import com.it.workit.admin.website.model.WebsiteManageVO;

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
	
	@RequestMapping(value="/siteIntroEdit.do", method = RequestMethod.GET)
	public String siteIntroEdit(Model model) {
		logger.info("사이트소개 수정 페이지 보여주기");
		Map<String, Object> map = websiteService.selectSiteIntro();
		model.addAttribute("map", map);
		
		return "admin/siteManage/siteIntroEdit";
	}
	
	@RequestMapping(value="/siteIntroEdit.do", method = RequestMethod.POST)
	public String siteIntroEdit_post(@ModelAttribute WebsiteManageVO vo, Model model) {
		logger.info("사이트소개 수정 처리 WebsiteManageVO={}", vo);
		int cnt = websiteService.updateSiteIntro(vo);
		logger.info("사이트소개 수정 결과 cnt={}", cnt);
		
		String msg = "사이트소개 수정 실패하였습니다", url="redirect:/admin/siteManage/siteIntro.do";
		if(cnt>0) {
			msg="성공적으로 수정 반영되었습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
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
