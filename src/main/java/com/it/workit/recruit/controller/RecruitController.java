package com.it.workit.recruit.controller;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;
import com.it.workit.recruit.model.RecruitannounceService;
import com.it.workit.recruit.model.RecruitannounceVO;
import com.it.workit.users.model.arealistVO;

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
	public String recruitwritesee(@ModelAttribute RecruitannounceVO vo, Model model) {
		logger.info("채용정보 화면처리 {}", vo);

		String msg="공고에 실패했습니다", url="/index.do";

		
		if(vo.getRecruitannounceWorkkind()==null || vo.getRecruitannounceWorkkind().isEmpty()) {
			vo.setRecruitannounceSworkkind("");
		}
		
		if(vo.getRecruitannounceWorkkind()==null || vo.getRecruitannounceWorkkind().isEmpty()) {
			vo.setRecruitannounceSworkkind("");
		}
		
		if(vo.getRecruitannounceUpcheckcarrer()==null || vo.getRecruitannounceUpcheckcarrer().isEmpty()) {
			vo.setRecruitannounceUpcheckcarrer("");
		}
		
		if(vo.getRecruitannounceHirestep()==null || vo.getRecruitannounceHirestep().isEmpty()) {
			vo.setRecruitannounceHirestep("");
		}
		
		if(vo.getRecruitannounceElse()==null || vo.getRecruitannounceElse().isEmpty()) {
			vo.setRecruitannounceElse("");
		}
		
		if(vo.getRecruitannounceLink()==null || vo.getRecruitannounceLink().isEmpty()) {
			vo.setRecruitannounceLink("");
		}
		
		int cnt=recruitannounceService.recruitannouncewrite(vo);
		
		logger.info("채용공고 등록 결과 {}", cnt);
		
		if(cnt>0) {
			msg="채용공고 등록 완료";
			url="/index.do";
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping(value="/recruitwrite.do", method=RequestMethod.GET)
	public String recruitwritewatch(Model model) {
		//언어목록, 지역목록1,2
		List<String> language=recruitannounceService.selectcwlanguage();
		model.addAttribute("language", language);
		
		List<arealistVO> arealist=recruitannounceService.selectcwplace();
		model.addAttribute("arealist", arealist);
		
		return "recruit/recruitwrite";
	}
	

	@RequestMapping("/recruitedit.do")
	public String recruitedit() {
		
		//4
		return "recruit/recruitedit";
	}
	
	
	@RequestMapping("/recruitdelete.do")
	public String recruitdelete(@RequestParam int recruitannounceNo, Model model) {
				
		String msg="삭제에 실패하셨습니다", url="/recruit/recruitdetail.do?recruitannounceNo="+recruitannounceNo;
		int cnt = recruitannounceService.recruitdelete(recruitannounceNo);
		logger.info("채용정보 화면처리 {}",cnt);
		
		msg="공고가 등록되었습니다.";
		url="/index.do";
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
}
