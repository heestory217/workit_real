package com.it.workit.faq.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.workit.faq.model.FaqService;
import com.it.workit.faq.model.FaqVO;


@Controller
@RequestMapping("/faq")
public class FaqController {
private static final Logger logger=LoggerFactory.getLogger(FaqController.class);
	
	@Autowired private FaqService faqService;
	
	@RequestMapping("/faqList.do")
	public String faqList(Model model) {
		//1
		logger.info("faq화면");
		
		//2
		List<FaqVO> faqList= faqService.faqselectAll();
		
		//3
		model.addAttribute("faqList",faqList);
		//4
		return "faq/faqList";
	}
	
	
	@RequestMapping(value = "/faqWrite.do", method = RequestMethod.GET)
	public void faqWrite_get() {
		logger.info("faq 쓰기화면");
	}
	
	
	@RequestMapping(value = "/faqWrite.do", method = RequestMethod.POST)
	public String faqWrite_post(@ModelAttribute FaqVO faqVo, Model model) {
		logger.info("faq 쓰기 화면");
		
		//2
		int cnt = faqService.faqinsert(faqVo);
		logger.info("글쓰기 처리 결과 cnt={}", cnt);
		
		String msg="등록 실패하였습니다", url="/faq/faqWrite.do";
		if (cnt>0) {
			msg="등록 성공하였습니다";
			url="/faq/faqList.do";
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping(value = "/faqDetail.do", method = RequestMethod.GET)
	public void faqDetail_get() {
		logger.info("faq 디테일 화면");
	}
}











