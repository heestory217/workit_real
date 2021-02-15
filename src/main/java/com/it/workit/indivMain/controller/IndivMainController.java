package com.it.workit.indivMain.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	
	//회원 맞춤 채용 공고
	@RequestMapping("/customPosting.do")
	public String customized(HttpSession session,Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("회원 맞춤 채용 공고 조회");
		
		List<Map<String, Object>> customList=indivmainService.selectCustomPost(userNo);
		logger.info("회원 맞춤 채용 공고 조회 결과, customList.size={}",customList.size());
		
		
		model.addAttribute("customList", customList);
		
		return "indiv/customPosting";
	}
	
	
	
	//2급 광고 구매 회사 채용 공고
	@RequestMapping("/todayRcmd.do")
	public void todayRcmd(Model model) {
		logger.info("오늘의 추천 화면 조회");
		
		List<Map<String, Object>> secAdList = indivmainService.selectSecClassAd();
		logger.info("오늘의 추천 채용 공고 결과, secAdList.size={}", secAdList.size());
		
		model.addAttribute("secAdList", secAdList);
	}
	
   //유료서비스 페이지 
   @RequestMapping("/serviceIntro.do")
   public void serviceIntro() {
      logger.info("서비스 설명 페이지 보여주기");
   }

}
