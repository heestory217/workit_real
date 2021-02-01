package com.it.workit.companyMypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/companyMypage")
public class CompanyMypageController {
	private static final Logger logger =LoggerFactory.getLogger(CompanyMypageController.class);

	@RequestMapping("/companyPayment.do")
	public void companyPayment() {
		
	}
	/*
	 1.마이페이지 수정 
	 2.포지션제안, 제안 회원 목록
	 3.블랙리스트
	 4.결제내역
	 5.공고목록-지원자목록
	 8.본인기업목록
	 
	 
	 
	 */
	@RequestMapping("/companyMypageMenu.do")
	public String companyMypageMenu() {
		
		return "companyMypage/companyMypageMenu";
	}
}
