package com.it.workit.resumes.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/resumes")
public class ResumesController {
	
	private static final Logger logger
		=LoggerFactory.getLogger(ResumesController.class);
	
	
	@RequestMapping("/resumesList.do")
	public void resumeList() {
		logger.info("리스트 화면 처리");
	}
	
}
