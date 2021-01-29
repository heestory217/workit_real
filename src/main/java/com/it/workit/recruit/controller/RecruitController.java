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
	public String recruitdetail(@RequestParam(defaultValue = "0") int recruitannounceNo, Model model) {
		//int recruitannounceNo=4;
		logger.info("채용정보 호출 no={}",recruitannounceNo);
		
		//2
		RecruitannounceVO recvo = recruitannounceService.recruitannounceselectByNo(recruitannounceNo);
		logger.info("채용정보 화면처리 {}",recvo);
		int num = corpservice.selectCorpNo(recvo.getUserNo());
		logger.info("기업번호 {}",num);
		CorpVO cvo = corpservice.selectCorp(num);
		logger.info("채용기업 화면처리 {}",cvo);
		
		String cwvo = recruitannounceService.recruitcorpwantwork(recruitannounceNo);
		logger.info("직무 {}",cwvo);
		String cwa = recruitannounceService.recruitcorpwantedarea(recruitannounceNo);
		logger.info("일하는 위치 {}",cwa);
		String lang = recruitannounceService.recruitcorpwantedlang(recruitannounceNo);
		logger.info("주언어 {}",lang);
		
		Date time = new Date();
		long d= ((recvo.getRecruitannounceEnddate()).getTime() - time.getTime())/(24*60*60*1000);
		
		//3
		model.addAttribute("RecruitannounceVO", recvo);
		model.addAttribute("CorpVO", cvo);
		model.addAttribute("cwvo", cwvo);
		model.addAttribute("cwa", cwa);
		model.addAttribute("lang", lang);
		model.addAttribute("d", d);
		
		
		return "recruit/recruitdetail";
	}
	
	
	@RequestMapping(value="/recruitwrite.do", method=RequestMethod.POST)
	public String recruitwritesee(Model model) {
		//받은 정보들 등록
		
		return "recruit/recruitwrite";
	}
	
	@RequestMapping(value="/recruitwrite.do", method=RequestMethod.GET)
	public String recruitwritewatch(Model model) {
		//언어목록, 지역목록1,2 
		
		
		return "recruit/recruitwrite";
	}
	

	
	
	@RequestMapping("/recruitedit.do")
	public String recruitedit() {
		
		//4
		return "recruit/recruitedit";
	}
	
	@RequestMapping("/recruitdelete.do")
	public String recruitdelete(@RequestParam int recruitannounceNo) {
		
		
		
		return "/index";
	}
}
