package com.it.workit.admin.recruit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.recruit.model.RecruitannounceService;
import com.it.workit.recruit.model.RecruitannounceVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/admin/users/corp")
public class AdminRecruitController {
	private static final Logger logger=LoggerFactory.getLogger(AdminRecruitController.class);

	@Autowired private UsersService usersService;
	@Autowired private RecruitannounceService recruitannounceService;
	
	
	@RequestMapping("/recruitList.do")
	public String recruitList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 채용공고 목록");
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord=recruitannounceService.recruitannouncecount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		List<RecruitannounceVO> list=recruitannounceService.recruitannounceall(searchVo);
		
		logger.info("list.size={}",list.size());
		model.addAttribute("list", list);
		
		return "/admin/users/corp/recruitList";
	}
	
	@RequestMapping("/recruitcheck.do")
	public String corpJudge(@RequestParam int recruitannounceNo, @RequestParam int check, Model model) {
		logger.info("채용공고 등록", recruitannounceNo, check);
		String url="/admin/users/corp/recruitList.do", msg="";
		
		if(check==1) {
			int cnt = recruitannounceService.recruitannouncerollback(recruitannounceNo);
			msg="채용공고를 대기중으로 변환했습니다";
		}else if(check==2) {
			int cnt = recruitannounceService.recruitannounceallowed(recruitannounceNo);
			msg="채용공고를 반려했습니다";
		}else if(check==3) {
			int cnt = recruitannounceService.recruitannouncedeny(recruitannounceNo);
			msg="채용공고를 통과했습니다";
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "common/message";
	}
	
	@RequestMapping("/recruitDetail.do")
	public String recruitDetail() {
		logger.info("관리자 채용공고 목록");

		return "/admin/users/corp/recruitDetail";
	}
}