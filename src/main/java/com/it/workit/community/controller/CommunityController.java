package com.it.workit.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/indiv/community")
public class CommunityController {
	private static final Logger logger
		=LoggerFactory.getLogger(CommunityController.class);
	
	@RequestMapping("/cmtyNavbar.do")
	public String sideNav() {
		logger.info("커뮤니티 사이드 메뉴바");
		
		return "indiv/community/cmtyNavbar";
	}
	
	@RequestMapping("/myQstn.do")
	public String myQstn() {
		logger.info("나의 질문 페이지 화면");
		
		return "indiv/community/myQstn";
	}
	
}
