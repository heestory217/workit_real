package com.it.workit.community.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value="/qstnWrite.do", method = RequestMethod.GET)
	public String qstnWrite_get() {
		logger.info("질문 등록 화면");
		
		return "indiv/community/qstnWrite";
	}

	//전체 질문 페이지 
	@RequestMapping("/qstnList.do")
	public String qstnList() {
		logger.info("전체 질문 목록");
		
		return "indiv/community/qstnList";
	}
	
	//질문상세보기
	@RequestMapping("/qstnDetail.do")
	public void qstnDetail() {
		logger.info("질문 상세 페이지 ");
	}
	
}
