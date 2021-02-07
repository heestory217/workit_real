package com.it.workit.applicant.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.applicant.model.ApplicantService;
import com.it.workit.applicant.model.ApplicantlistVO;
import com.it.workit.recruit.model.RecruitannounceService;
import com.it.workit.recruit.model.RecruitannounceVO;

@Controller
@RequestMapping("/company/ApplicantMng")
public class CorpApplicantController {

	private static final Logger logger = LoggerFactory.getLogger(CorpApplicantController.class);
	@Autowired private ApplicantService appService;
	@Autowired private RecruitannounceService recruitService;
	
	@RequestMapping("/allApplicant.do")
	public void allApplicant(HttpSession session, Model model){
		logger.info("전체 지원자 목록 보여주기");

		int userNo = (Integer) session.getAttribute("userNo");
		
		List<ApplicantlistVO> list = appService.selectAllApplicantFromCorp(userNo);
		logger.info("전체 지원자 수 = {}", list.size());
		
		//해당 공고에 맞는 채용공고명, 고용형태 넘겨주기
		List<RecruitannounceVO> recruitList = new ArrayList<RecruitannounceVO>();
		for(ApplicantlistVO vo : list) {
			int recruitannounceNo = vo.getRecruitannounceNo();
			RecruitannounceVO recruitVo = recruitService.recruitannounceselectByNo(recruitannounceNo);
			recruitList.add(recruitVo);
		}

		model.addAttribute("list", list);
		model.addAttribute("recruitList", recruitList);
	}
	
	@RequestMapping("/applicantByRecruit.do")
	public void applicantByRecruit(){}
	
	@RequestMapping("/prohibit.do")
	public void prohibit(){}
}
