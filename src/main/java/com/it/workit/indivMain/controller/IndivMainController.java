package com.it.workit.indivMain.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.indivMain.model.IndivMainService;

@Controller
@RequestMapping("/indiv")
public class IndivMainController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndivMainController.class);
	
	
	@Autowired private IndivMainService indivmainService;
	
	@RequestMapping("/main.do")
	public void main() {
		logger.info("개인 메인 화면");
	}
	
	//채용 마감 임박 조회
	@RequestMapping("/nearDeadline.do")
	public String deadline(Model model) {
		logger.info("채용 마감 임박 조회");
		
		List<Map<String, Object>> list=indivmainService.selectByDeadline();
		logger.info("채용 마감 임박 조회 결과, list.size={}",list.size());
		
		
		model.addAttribute("list", list);
		
		return "indiv/nearDeadline";
	}

	//신규 채용 공고
	@RequestMapping("/newPosting.do")
	public String newPosting(Model model) {
		logger.info("신규 채용 공고 조회");
		
		List<Map<String, Object>> newPostList=indivmainService.selectNesPost();
		logger.info("신규 채용 공고 조회 결과, newPostList.size={}",newPostList.size());
		
		
		model.addAttribute("newPostList", newPostList);
		
		return "indiv/newPosting";
	}

}
