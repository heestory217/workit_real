package com.it.workit.indivMain.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/indiv")
public class IndivMainController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndivMainController.class);
	
	
	@RequestMapping("/main.do")
	public void main() {
		logger.info("개인 메인 화면");
	}

}
