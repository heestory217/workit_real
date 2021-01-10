package com.it.workit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EunbiController {
	private static final Logger logger
		= LoggerFactory.getLogger(EunbiController.class);
	
	@RequestMapping("/eunbi.do")
	public String eunbi() {
		logger.info("eunbi.jsp파일 보여주기");
		
		return "eunbi";
	}
}
