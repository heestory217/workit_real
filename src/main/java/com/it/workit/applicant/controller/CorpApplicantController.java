package com.it.workit.applicant.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.applicant.model.ApplicantService;

@Controller
@RequestMapping("/company/ApplicantMng")
public class CorpApplicantController {

	private static final Logger logger = LoggerFactory.getLogger(CorpApplicantController.class);
	@Autowired private ApplicantService appService;
	
	@RequestMapping("/allApplicant.do")
	public void allApplicant(HttpSession session, Model model){
		logger.info("전체 지원자 목록 보여주기");

		int userNo = (Integer) session.getAttribute("userNo");

		List<Map<String, Object>> applist = appService.selectAllApplicantView(userNo);
		logger.info("전체 지원자 수 = {}", applist.size());
		
		//private int applicantlistPapercheck;	//서류통과여부 (1통과 2탈락 3대기)
		int pass=0, fail=0, wait=0;
		for(Map<String, Object> map : applist) {
			//java.lang.ClassCastException: java.math.BigDecimal cannot be cast to java.lang.Integer
			int check = Integer.parseInt(String.valueOf(map.get("APPLICANTLIST_PAPERCHECK")));
			if(check==1) {
				pass += 1;
			}else if(check==2) {
				fail += 1;
			}else if(check==3) {
				wait += 1;
			}
		}
		logger.info("합격 지원자 수 = {}", pass);
		logger.info("불합격 지원자 수 = {}", fail);
		logger.info("심사중 지원자 수 = {}", wait);
		
		
		model.addAttribute("applist", applist);
		model.addAttribute("pass", pass);
		model.addAttribute("fail", fail);
		model.addAttribute("wait", wait);
		model.addAttribute("CountAllApplicant", applist.size());
	}
	
	@RequestMapping("/applicantByRecruit.do")
	public void applicantByRecruit(){}
	
	@RequestMapping("/prohibit.do")
	public void prohibit(){}
}
