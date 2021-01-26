package com.it.workit.recruit.controller;

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
import com.it.workit.recruit.model.CorpwantedareaVO;
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
	public String recruitdetail(/*@RequestParam(defaultValue = "0") int recruitannounceNo,*/ Model model) {
		int recruitannounceNo=1;
		logger.info("채용정보 호출 no={}",recruitannounceNo);
		
		//2
		RecruitannounceVO recvo = recruitannounceService.recruitannounceselectByNo(recruitannounceNo);
		logger.info("채용정보 화면처리 {}",recvo);
		int num = corpservice.selectCorpNo(recvo.getUserNo());
		CorpVO cvo = corpservice.selectCorp(num);
		logger.info("채용기업 화면처리 {}",cvo);
		
		String cwvo = recruitannounceService.recruitcorpwantwork(recruitannounceNo);
		logger.info("직무 {}",cwvo);
		String cwa = recruitannounceService.recruitcorpwantedarea(recruitannounceNo);
		logger.info("일하는 위치 {}",cwa);
		//3
		model.addAttribute("RecruitannounceVO", recvo);
		model.addAttribute("CorpVO", cvo);
		model.addAttribute("cwvo", cwvo);
		model.addAttribute("cwa", cwa);
		
		
		return "recruit/recruitdetail";
	}
	
	
	@RequestMapping("/recruitwrite.do")
	public String recruitwrite() {
		
		//4
		return "recruit/recruitwrite";
	}
}
