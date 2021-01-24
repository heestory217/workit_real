package com.it.workit.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class CusServiceNav {

	private static final Logger logger=LoggerFactory.getLogger(CusServiceNav.class);
	
	@RequestMapping(value = "/cusServiceNav.do")
	public void cusService() {
		logger.info("nav화면");
	}
}
