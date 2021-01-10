package com.it.workit;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ShOhController {
	private static final Logger logger = LoggerFactory.getLogger(ShOhController.class);
	
	@RequestMapping("/shOh.do")
	public void shOhTest() {
		logger.info("shoh테스트 jsp 잘 확인됨");
	}
}
