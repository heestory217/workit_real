package com.it.workit.applicant.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company/ApplicantMng")
public class CorpApplicantController {

	private static final Logger logger = LoggerFactory.getLogger(CorpApplicantController.class);
	
	@RequestMapping("/allApplicant.do")
	public void allApplicant(){}
	
	@RequestMapping("/applicantByRecruit.do")
	public void applicantByRecruit(){}
	
	@RequestMapping("/prohibit.do")
	public void prohibit(){}
}
