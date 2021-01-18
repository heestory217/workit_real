package com.it.workit.faq.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/qna")
public class FaqController {
private static final Logger logger=LoggerFactory.getLogger(FaqController.class);
	
	
	@RequestMapping("/qnaList.do")
	public void qnaList() {
		logger.info("qna화면");
	}
}
