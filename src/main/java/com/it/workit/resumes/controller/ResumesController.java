package com.it.workit.resumes.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/resumes")
public class ResumesController {
	
	private static final Logger logger
		=LoggerFactory.getLogger(ResumesController.class);
	
	
	@RequestMapping(value = "/resumesList.do", method = RequestMethod.GET)
	public void resumeList() {
		logger.info("리스트 화면 처리");
	}
	
	@RequestMapping("/resumeWrite.do")
	public void resumeWrite() {
		logger.info("이력서 쓰기 화면");
	}
	
	
}
