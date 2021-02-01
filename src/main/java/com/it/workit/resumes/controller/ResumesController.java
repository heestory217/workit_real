package com.it.workit.resumes.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.workit.resumes.model.ResumesService;

@Controller
@RequestMapping("/resumes")
public class ResumesController {
	
	private static final Logger logger
		=LoggerFactory.getLogger(ResumesController.class);
	
	@Autowired private ResumesService rsService;
	
	
	@RequestMapping(value = "/resumesList.do", method = RequestMethod.GET)
	public void resumeList() {
		logger.info("리스트 화면 처리");
	}
	
	@RequestMapping(value ="/resumeWrite.do", method = RequestMethod.GET)
	public void resumeWrite_get() {
		logger.info("이력서 쓰기 화면");
	}
	
	/*
	@RequestMapping(value ="/resumeWrite.do", method = RequestMethod.POST)
	public void resumeWrite_post(@ModelAttribute AwardVO avo, @ModelAttribute CarrerVO cvo, 
			HttpServletRequest request) {
		logger.info("어워드 avo={}", avo);
		logger.info("어워드 avo={}", cvo);
		
		String awardDate = avo.getAwardAbout();
		String awardAbout = avo.getAwardDate();
		logger.info("get awardDate={}",awardDate);
		String[] awardDateArr = awardDate.split(",");
		logger.info("awardDate의 개수? awardDateArr.length={}", awardDateArr.length);
		
		for (int i = 0; i < awardDateArr.length; i++) {
			String award1 = awardDateArr[0];
			String award2 = awardDateArr[1];
			logger.info("awardDate 1 award1={}",award1);
			logger.info("awardDate 2 award2={}",award2);

			
			//rsService.insertAward(avo);
		}
	}
	*/
}
