package com.it.workit.qna.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/qna")
public class QnaController {
	private static final Logger logger=LoggerFactory.getLogger(QnaController.class);
	
	
	@RequestMapping("/qnaList.do")
	public void qnaList() {
		logger.info("화면출력");
	}
	
}
