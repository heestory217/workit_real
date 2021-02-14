package com.it.workit.admin.recruit.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
		logger.info("총 레코드 수, totalRecord={}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		logger.info("pagingInfo={}",pagingInfo);
				
		List<RecruitannounceVO> list=recruitannounceService.recruitannounceall(searchVo);
				
		logger.info("list.size={}",list.size());
		model.addAttribute("list", list);
		
		return "/admin/users/corp/recruitList";
	}
	
	@RequestMapping("/recruitDetail.do")
	public String recruitDetail() {
		logger.info("관리자 채용공고 목록");

		return "/admin/users/corp/recruitDetail";
	}
}