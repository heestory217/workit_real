package com.it.workit.admin.advertising.controller;

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
import com.it.workit.recruit.model.AdminadvertisingVO;
import com.it.workit.recruit.model.RecruitannounceService;


@Controller
@RequestMapping("/admin/advertising")
public class AdvertisingController {
	private static final Logger logger=LoggerFactory.getLogger(AdvertisingController.class);

	@Autowired private RecruitannounceService recruitannounceService;
	
	@RequestMapping("/advertisingOnline.do")
	public String recruitList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("관리자 현재 광고중인 목록");
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
				
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int fst=recruitannounceService.selectadvertisingcountfst();
		logger.info("1등급 수{}", fst);
		int sec=recruitannounceService.selectadvertisingcountsec();
		logger.info("2등급 수{}", sec);
		int totalRecord=recruitannounceService.selectadvertisinglistcount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		List<AdminadvertisingVO> fstlist=recruitannounceService.selectadvertisingfstclass();
		List<AdminadvertisingVO> seclist=recruitannounceService.selectadvertisingsecclass();
		List<AdminadvertisingVO> list=recruitannounceService.selectadvertisinglist(searchVo);
		
		
		model.addAttribute("fstlist", fstlist);
		logger.info("호출 수{}", fstlist.get(1));
		model.addAttribute("seclist", seclist);
		model.addAttribute("list", list);
		logger.info("호출 수{}", list.get(1));
		
		model.addAttribute("fst", fst);
		model.addAttribute("sec", sec);

		return "/admin/advertising/advertisingOnline";
	}

}
