package com.it.workit.recruit.controller;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;
import com.it.workit.recruit.model.RecruitannounceService;
import com.it.workit.recruit.model.RecruitannounceVO;

@Controller
@RequestMapping("/recruit")
public class RecruitController {
	private static final Logger logger
	=LoggerFactory.getLogger(RecruitController.class);
	
	@Autowired private RecruitannounceService recruitannounceService;
	@Autowired private CorpService corpservice;
	
	
	
	@RequestMapping("/recruitdetail.do")
	public String recruitdetail(/*@RequestParam(defaultValue = "0") int recruitannounceNo, */Model model) {
		int recruitannounceNo=5;
		logger.info("채용정보 호출 no={}",recruitannounceNo);
		
		//2
		RecruitannounceVO recvo = recruitannounceService.recruitannounceselectByNo(recruitannounceNo);
		logger.info("채용정보 화면처리 {}",recvo);
		
		//int num = corpservice.selectCorpNo(3/*recvo.getUserNo()*/);
		CorpVO cvo = corpservice.selectCorp(3);
		logger.info("채용기업 화면처리 {}",cvo);
		
		String cwvo = recruitannounceService.recruitcorpwantwork(recruitannounceNo);
		logger.info("직무 {}",cwvo);
		String cwa = recruitannounceService.recruitcorpwantedarea(recruitannounceNo);
		logger.info("일하는 위치 {}",cwa);
		String lang = recruitannounceService.recruitcorpwantedlang(recruitannounceNo);
		logger.info("주언어 {}",lang);
		
		Date time = new Date();
		long d= ((recvo.getRecruitannounceEnddate()).getTime() - time.getTime())/(24*60*60*1000)+17;
		
		//3
		model.addAttribute("RecruitannounceVO", recvo);
		model.addAttribute("CorpVO", cvo);
		model.addAttribute("cwvo", cwvo);
		model.addAttribute("cwa", cwa);
		model.addAttribute("lang", lang);
		model.addAttribute("d", d);
		
		
		return "recruit/recruitdetail";
	}
	
	
	@RequestMapping("/recruitwrite.do")
	public String recruitwrite() {
		
		//4
		return "recruit/recruitwrite";
	}
	
	@RequestMapping("/recruitedit.do")
	public String recruitedit() {
		
		//4
		return "recruit/recruitedit";
	}
}
