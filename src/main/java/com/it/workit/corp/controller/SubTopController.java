package com.it.workit.corp.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.corp.model.CorpService;

@Controller
public class SubTopController {
	private static final Logger logger
	=LoggerFactory.getLogger(SubTopController.class);
	
	@Autowired private CorpService corpService;
	
	@RequestMapping("/company/subTop.do")
	public void companySubtop(HttpSession session, Model model) {
		logger.info("기업 서브탑 보여주기");
		int userNo = (Integer)session.getAttribute("userNo");
		int corpNo = corpService.selectCorpNo(userNo);
		logger.info("corpNo={}",corpNo);
		model.addAttribute("corpNo",corpNo);
		
	}
	
	@RequestMapping("/indiv/subTop.do")
	public void indivSubtop() {
		logger.info("개인 서브탑 보여주기");
	}
}
