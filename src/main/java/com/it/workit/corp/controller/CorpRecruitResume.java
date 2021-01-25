package com.it.workit.corp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.corp.model.CorpService;

@Controller
public class CorpRecruitResume {

	private final static Logger logger = LoggerFactory.getLogger(CorpRecruitResume.class);
	
	@Autowired CorpService corpService;
	
	@RequestMapping("/comapny/CorpRecruitResume.do")
	public String CorpRecruitResume(HttpSession session,Model model) {
		logger.info("채용 공고별 지원서, 맞춤채용 공고 보여주기");
		//1. 
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("userNo={}",userNo);
		
		List<Map<String, Object>> recruitList = corpService.selectRecruitList(userNo);
		logger.info("recruitList={}",recruitList.size());
		
		model.addAttribute("rList",recruitList);
		return "company/CorpRecruitResume";
	}
	
	
}
