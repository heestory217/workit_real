package com.it.workit.admin.advertising.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.recruit.model.AdminadvertisingVO;
import com.it.workit.recruit.model.RecruitannounceService;


@Controller
@RequestMapping("/admin/advertising")
public class AdvertisingController {
	/*
	private static final Logger logger=LoggerFactory.getLogger(AdvertisingController.class);

	@Autowired private RecruitannounceService recruitannounceService;
	
	@RequestMapping("/advertisingList.do")
	public String recruitList(Model model) {
		logger.info("관리자 현재 광고중인 목록");
		
		List<AdminadvertisingVO> fstlist=recruitannounceService.selectadvertisingfstclass();
		List<AdminadvertisingVO> seclist=recruitannounceService.selectadvertisingfstclass();
		
		int fst=recruitannounceService.selectadvertisingcountfst();
		logger.info("1등급 수{}", fst);
		int sec=recruitannounceService.selectadvertisingcountsec();
		logger.info("2등급 수{}", sec);
		
		model.addAttribute("fstlist", fstlist);
		model.addAttribute("seclist", seclist);
		model.addAttribute("fst", fst);
		model.addAttribute("sec", sec);

		return "/admin/advertising/advertisingList";
	}
	*/
}
