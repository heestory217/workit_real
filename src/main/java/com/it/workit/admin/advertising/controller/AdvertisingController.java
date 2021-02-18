package com.it.workit.admin.advertising.controller;

import java.util.Date;
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
import com.it.workit.recruit.model.AdminadvertisingVO;
import com.it.workit.recruit.model.AdvertisingVO;
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
		model.addAttribute("seclist", seclist);
		model.addAttribute("list", list);
		
		model.addAttribute("fst", fst);
		model.addAttribute("sec", sec);

		return "/admin/advertising/advertisingOnline";
	}
	
	
	@RequestMapping("/advertisingcheck.do")
	public String recruitjudge(@RequestParam int recruitannounceNo, @RequestParam int check, @RequestParam int paidserviceNo, Model model) {
		logger.info("광고 등록 {}", paidserviceNo);
		String url="/admin/advertising/advertisingOnline.do", msg="광고등록에 실패했습니다";
		
		int fst=recruitannounceService.selectadvertisingcountfst();
		int sec=recruitannounceService.selectadvertisingcountsec();
		
		AdvertisingVO vo = new AdvertisingVO();
		
		if(fst+sec>=9) {
			msg="모든 광고가 사용중입니다.";
		}else if(fst>=3 && (paidserviceNo>=7 && paidserviceNo<=9)) {
			msg="모든 1등급 광고는 사용중에 있습니다";
		}else if(sec>=6 && (paidserviceNo>=10 && paidserviceNo<=12)) {
			msg="모든 2등급 광고는 사용중에 있습니다";
		}else {
			if(check==2) {
				if(paidserviceNo==7 || paidserviceNo==10) {
					int cnt = recruitannounceService.advertisingallowedseven(recruitannounceNo);
					msg="채용공고가 광고로 등록되었습니다";
				}else if(paidserviceNo==8 || paidserviceNo==11) {
					int cnt = recruitannounceService.advertisingallowedfift(recruitannounceNo);
					msg="채용공고가 광고로 등록되었습니다";
				}else if(paidserviceNo==9 || paidserviceNo==12) {
					int cnt = recruitannounceService.advertisingallowedmonth(recruitannounceNo);
					msg="채용공고가 광고로 등록되었습니다";
				}
			}else if(check==3) {
				int cnt = recruitannounceService.advertisingdeny(recruitannounceNo);
				msg="광고를 반려했습니다";
			}
		}
		
		model.addAttribute("url",url);
		model.addAttribute("msg",msg); 
		  
		return "common/message";
	}
}
