package com.it.workit.corp.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CorpRecruitResume {

	private final static Logger logger = LoggerFactory.getLogger(CorpRecruitResume.class);
	
	@RequestMapping("/comapny/CorpRecruitResume.do")
	public String CorpRecruitResume() {
		logger.info("채용 공고별 지원서 보여주기");
		return "company/CorpRecruitResume";
	}
	
	
}
