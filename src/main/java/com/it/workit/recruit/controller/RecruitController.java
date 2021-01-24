package com.it.workit.recruit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/recruit")
public class RecruitController {
	private static final Logger logger
	=LoggerFactory.getLogger(RecruitController.class);

	@RequestMapping("/recruitdetail.do")
	public String register() {
		logger.info("채용공고 상세");

		return "recruit/recruitdetail";
	}
}
