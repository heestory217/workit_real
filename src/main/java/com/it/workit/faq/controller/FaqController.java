package com.it.workit.faq.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/faqDetail.do", method = RequestMethod.GET)
	public String faqDetail_get(@RequestParam(defaultValue = "0") int faqNo, Model model) {
		logger.info("faq 디테일 화면 파라미터 no={}",faqNo);

		//2
		FaqVO faqVo = faqService.faqselectByNo(faqNo);
		logger.info("화면처리 faqVo={}",faqVo);

		//3
		model.addAttribute("faqVo", faqVo);

		//4
		return "faq/faqDetail";
	}
	
}











