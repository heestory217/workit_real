package com.it.worit.recruitannounce.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/recruitannounce")
public class RecruitannounceController {
	private static final Logger logger=LoggerFactory.getLogger(RecruitannounceController.class);
	//@Autowired private RecruitannounceService recuritService;
	
	@RequestMapping("/recruitannouncedetail.do")
	public String recruitdetail() {
		logger.info("채용공고 상세");
		return "recruitannounce/recruitannouncedetail";
	}
}


