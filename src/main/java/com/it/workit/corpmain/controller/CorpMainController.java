package com.it.workit.corpmain.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.corp.model.CorpService;

@Controller
@RequestMapping("/company")
public class CorpMainController {
	private static final Logger logger
	=LoggerFactory.getLogger(CorpMainController.class);
	
	@Autowired private CorpService corpService;
	
	//메인 모달에서 리뷰로 넘어가기 위해 corpNo 필요
	@RequestMapping("/main.do")
	public void CorpMain(HttpSession session, Model model) {
		logger.info("기업 메인 보여주기");
		
		//희정 추가 - 모달에서 사용
		int userNo = (Integer)session.getAttribute("userNo");
		int corpNo = corpService.selectCorpNo(userNo);
		logger.info("corpNo={}",corpNo);
		model.addAttribute("corpNo",corpNo);
	}

}
