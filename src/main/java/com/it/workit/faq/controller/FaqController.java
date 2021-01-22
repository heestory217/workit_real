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
	
	@RequestMapping(value = "/faqUpdate.do", method = RequestMethod.GET)
	public String faqUpdate_get(@RequestParam(defaultValue = "0") int faqNo, Model model) {
		logger.info("faq 업데이트 화면 파라미터 no={}",faqNo);
		
		//2
		FaqVO faqVo = faqService.faqselectByNo(faqNo);
		if (faqNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/faq/faqList.do");
			return "common/message";
		}
		logger.info("화면처리 faqVo={}",faqVo);
		
		//3
		model.addAttribute("faqVo", faqVo);
		
		//4
		return "faq/faqUpdate";
	}
	
	@RequestMapping(value = "/faqUpdate.do", method = RequestMethod.POST)
	public String faqUpdate_post(@ModelAttribute FaqVO faqVo, Model model) {
		logger.info("faq 디테일 화면 파라미터 faqVo={}",faqVo);
		
		//2
		int cnt = faqService.faqupdate(faqVo);
		
		String msg="등록 실패하였습니다", url="/faq/faqUpdate.do?faqNo="+faqVo.getFaqNo();
		if (cnt>0) {
			msg="등록 성공하였습니다";
			url="/faq/faqDetail.do?faqNo="+faqVo.getFaqNo();
		}
		
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		return "common/message";
	}
	
	@RequestMapping(value = "/faqNav.do")
	public void faqNav() {
		logger.info("nav화면");
	}
	
	
	@RequestMapping(value = "/faqDelete.do")
	public String faqDelete(@ModelAttribute FaqVO faqVo
			,Model model) {
		logger.info("삭제처리 파라미터 faqVo={}", faqVo);
		
		//2
		int cnt = faqService.faqdelete(faqVo);
		
		String msg="삭제 실패하였습니다", url="/faq/faqDetail.do?faqNo"+faqVo.getFaqNo();
		if (cnt>0) {
			msg="삭제 성공하였습니다";
			url="/faq/faqList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}











