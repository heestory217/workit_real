package com.it.workit.corpmain.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company")
public class CorpMainController {
	private static final Logger logger
	=LoggerFactory.getLogger(CorpMainController.class);
	
	@RequestMapping("/main.do")
	public void CorpMain() {
		logger.info("기업 메인 보여주기");
	}
}
