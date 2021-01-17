package com.it.workit.corp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.workit.corp.model.CorpVO;

@Controller
@RequestMapping("/company/corp")
public class CorpController {
	private static final Logger logger
	=LoggerFactory.getLogger(CorpController.class);
	
	@RequestMapping(value="/corpWrite.do", method=RequestMethod.GET )
	public String corpRegister(HttpServletRequest request) {
		logger.info("기업 등록 화면 보여주기");
		return "company/corp/corpWrite";
	}
	
	@RequestMapping(value="/corpWrite.do", method=RequestMethod.POST)
	public String corpRegisterPost(Model model) {
		model.addAttribute("msg","들어옴");
		model.addAttribute("url","/index.do");
		return "common/message";
	}
	
}
