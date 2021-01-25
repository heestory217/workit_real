package com.it.workit.corp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.corp.model.CorpService;

@Controller
@RequestMapping("/comapny")
public class CorpRecruitResume {

	private final static Logger logger = LoggerFactory.getLogger(CorpRecruitResume.class);
	
	@Autowired CorpService corpService;
	
	@RequestMapping("/CorpRecruitResume.do")
	public String CorpRecruitResume(HttpSession session,Model model) {
		logger.info("채용 공고별 지원서, 맞춤채용 공고 보여주기");
		//1. 
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("userNo={}",userNo);

		//채용공고별 지원자 보여주기 채용공고 카테고리를 위한 db작업
		List<Map<String, Object>> recruitList = corpService.selectRecruitList(userNo);
		logger.info("recruitList={}",recruitList.size());
		
		//맞춤 이력서 보여주기를 위한 사용자의 채용공고 정보 : 언어, 경력, 지역
		//List<Map<String, Object>> recruitCont = CorpService.selectRecruitCont(userNo); 		
		
		model.addAttribute("rList",recruitList);
		return "company/CorpRecruitResume";
	}
	
	@ResponseBody
	@RequestMapping("/CorpRecruitResumeList.do")
	public List<Map<String, Object>> applList(@RequestParam int recruitannounceNo) {
		logger.info("채용공고별 지원자 리스트 recruitannounceNo={}",recruitannounceNo);
		
		//리스트를 선택하면 언어와 지역을 가져오는 다중선택
		List<Map<String, Object>> appList = corpService.selectAppList(recruitannounceNo);
		
		return appList;
	}
	
}
