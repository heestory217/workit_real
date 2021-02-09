package com.it.workit.recruit.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.Utility;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;
import com.it.workit.corp.model.CorpimgVO;
import com.it.workit.language.model.LanguageVO;
import com.it.workit.recruit.model.AdvertisingVO;
import com.it.workit.recruit.model.RecruitannounceService;
import com.it.workit.recruit.model.RecruitannounceVO;
import com.it.workit.users.model.arealistVO;

@Controller
@RequestMapping("/recruit")
public class RecruitController {
	private static final Logger logger
	=LoggerFactory.getLogger(RecruitController.class);
	
	@Autowired private RecruitannounceService recruitannounceService;
	@Autowired private CorpService corpservice;
	
	
	
	@RequestMapping("/recruitdetail.do")
	public String recruitdetail(@RequestParam(defaultValue = "0") int recruitannounceNo, Model model) {
		//int recruitannounceNo=4;
		logger.info("채용정보 호출 no={}",recruitannounceNo);
		
		//2
		RecruitannounceVO recvo = recruitannounceService.recruitannounceselectByNo(recruitannounceNo);
		logger.info("채용정보 화면처리 {}",recvo);
		int num = corpservice.selectCorpNo(recvo.getUserNo());
		logger.info("기업번호 {}",num);
		CorpVO cvo = corpservice.selectCorp(num);
		logger.info("채용기업 화면처리 {}",cvo);
		
		String cwvo = recruitannounceService.recruitcorpwantwork(recruitannounceNo);
		logger.info("직무 {}",cwvo);
		String cwa = recruitannounceService.recruitcorpwantedarea(recruitannounceNo);
		logger.info("일하는 위치 {}",cwa);
		String lang = recruitannounceService.recruitcorpwantedlang(recruitannounceNo);
		logger.info("주언어 {}",lang);
		
		Date time = new Date();
		long d= ((recvo.getRecruitannounceEnddate()).getTime() - time.getTime())/(24*60*60*1000);
		
		List<CorpimgVO> imgList = corpservice.corpImgList(num);
		
		//3
		model.addAttribute("RecruitannounceVO", recvo);
		model.addAttribute("imgList", imgList);
		model.addAttribute("CorpVO", cvo);
		model.addAttribute("cwvo", cwvo);
		model.addAttribute("cwa", cwa);
		model.addAttribute("lang", lang);
		model.addAttribute("d", d);
		
		
		return "recruit/recruitdetail";
	}
	
	
	@RequestMapping(value="/recruitwrite.do", method=RequestMethod.POST)
	public String recruitwritesee(@ModelAttribute RecruitannounceVO vo, Model model, @RequestParam String year,
			@RequestParam String month, @RequestParam String day) {
		logger.info("채용정보 화면처리 {}", vo);

		String msg="공고등록에 실패했습니다", url="/index.do";
		
		String ddate;
		
		int to = Integer.parseInt(month);
		int to2 = Integer.parseInt(day);
	
		if(to<10) {
			month="0"+month;
		}
		if(to2<10) {
			day="0"+day;
		}

		ddate="20"+year+"-"+month+"-"+day;
		logger.info("날짜 {}", ddate);
		
		Date tox=new Date();
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				tox = transFormat.parse(ddate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		logger.info("날짜 {}", ddate);
		vo.setRecruitannounceEnddate(tox);
		
		if(vo.getRecruitannounceWorkkind()==null || vo.getRecruitannounceWorkkind().isEmpty()) {
			vo.setRecruitannounceSworkkind("");
		}
		
		if(vo.getRecruitannounceWorkkind()==null || vo.getRecruitannounceWorkkind().isEmpty()) {
			vo.setRecruitannounceSworkkind("");
		}
		
		if(vo.getRecruitannounceUpcheckcarrer()==null || vo.getRecruitannounceUpcheckcarrer().isEmpty()) {
			vo.setRecruitannounceUpcheckcarrer("");
		}
		
		if(vo.getRecruitannounceHirestep()==null || vo.getRecruitannounceHirestep().isEmpty()) {
			vo.setRecruitannounceHirestep("");
		}
		
		if(vo.getRecruitannounceElse()==null || vo.getRecruitannounceElse().isEmpty()) {
			vo.setRecruitannounceElse("");
		}
		
		if(vo.getRecruitannounceLink()==null || vo.getRecruitannounceLink().isEmpty()) {
			vo.setRecruitannounceLink("");
		}
		
		int cnt=recruitannounceService.recruitannouncewrite(vo);
		
		logger.info("채용공고 등록 결과 {}", cnt);
		
		if(cnt>0) {
			msg="채용공고 등록 완료";
			url="/index.do";
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping(value="/recruitwrite.do", method=RequestMethod.GET)
	public String recruitwritewatch(Model model) {
		//언어목록, 지역목록1,2
		List<LanguageVO> language=recruitannounceService.selectcwlanguage();
		model.addAttribute("language", language);
		
		List<arealistVO> arealist=recruitannounceService.selectcwplace();
		model.addAttribute("arealist", arealist);
		
		return "recruit/recruitwrite";
	}
	

	@RequestMapping(value="/recruitedit.do", method=RequestMethod.GET)
	public String recruiteditcall(@RequestParam int recruitannounceNo, Model model) {
		logger.info("채용공고번호 {}", recruitannounceNo);
		RecruitannounceVO vo=recruitannounceService.recruitannounceselectByNo(recruitannounceNo);
		model.addAttribute("RecruitannounceVO", vo);
		
		List<LanguageVO> language=recruitannounceService.selectcwlanguage();
		model.addAttribute("language", language);
		
		List<arealistVO> arealist=recruitannounceService.selectcwplace();
		model.addAttribute("arealist", arealist);
		//4
		return "recruit/recruitedit";
	}
	
	@RequestMapping(value="/recruitedit.do", method=RequestMethod.POST)
	public String recruiteditwrite(@ModelAttribute RecruitannounceVO vo, Model model, @RequestParam String year,
			@RequestParam String month, @RequestParam String day) {
		logger.info("채용정보 화면처리 {}", vo);

		String msg="공고수정에 실패했습니다", url="/index.do";
		
		String ddate;
		
		int to = Integer.parseInt(month);
		int to2 = Integer.parseInt(day);
	
		if(to<10) {
			month="0"+month;
		}
		if(to2<10) {
			day="0"+day;
		}

		ddate="20"+year+"-"+month+"-"+day;
		logger.info("날짜 {}", ddate);
		
		Date tox=new Date();
		
		
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			try {
				tox = transFormat.parse(ddate);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		logger.info("날짜 {}", ddate);
		vo.setRecruitannounceEnddate(tox);
		
		if(vo.getRecruitannounceWorkkind()==null || vo.getRecruitannounceWorkkind().isEmpty()) {
			vo.setRecruitannounceSworkkind("");
		}
		
		if(vo.getRecruitannounceWorkkind()==null || vo.getRecruitannounceWorkkind().isEmpty()) {
			vo.setRecruitannounceSworkkind("");
		}
		
		if(vo.getRecruitannounceUpcheckcarrer()==null || vo.getRecruitannounceUpcheckcarrer().isEmpty()) {
			vo.setRecruitannounceUpcheckcarrer("");
		}
		
		if(vo.getRecruitannounceHirestep()==null || vo.getRecruitannounceHirestep().isEmpty()) {
			vo.setRecruitannounceHirestep("");
		}
		
		if(vo.getRecruitannounceElse()==null || vo.getRecruitannounceElse().isEmpty()) {
			vo.setRecruitannounceElse("");
		}
		
		if(vo.getRecruitannounceLink()==null || vo.getRecruitannounceLink().isEmpty()) {
			vo.setRecruitannounceLink("");
		}
		
		int cnt=recruitannounceService.recruitannounceedit(vo);
		
		logger.info("채용공고 수정 결과 {}", cnt);
		
		if(cnt>0) {
			msg="채용공고 수정 완료";
			url="/index.do";
		}

		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping("/recruitdelete.do")
	public String recruitdelete(@RequestParam int recruitannounceNo, Model model) {
				
		String msg="삭제에 실패하셨습니다", url="/recruit/recruitdetail.do?recruitannounceNo="+recruitannounceNo;
		int cnt = recruitannounceService.recruitdelete(recruitannounceNo);
		logger.info("채용정보 화면처리 {}",cnt);
		
		msg="공고가 등록되었습니다.";
		url="/index.do";
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		//4
		return "common/message";
	}
	
	
	@RequestMapping("recruitlist.do")
	public String adverMain(Model model,HttpSession session,
			@ModelAttribute AdvertisingVO vo) {
		
			int userNo=(Integer) session.getAttribute("userNo");
			vo.setUserNo(userNo);
			logger.info("개인 마이페이지 - 결제내역 view 보여주기 / userno={}",userNo);
			logger.info("고고 {}", vo);

			//[1]pagingInfo
			PaginationInfo pagingInfo=new PaginationInfo();
			pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
			pagingInfo.setCurrentPage(vo.getCurrentPage());
			pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);

			//[2]searchVo
			vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
			vo.setRecordCountPerPage(Utility.RECORD_COUNT);
			
			/*
			int totalRecord=recruitannounceService.ordersGetTotalRecruit(vo);
			logger.info("총 레코드 수, totalRecord={}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			*/
			
			List<AdvertisingVO> list=recruitannounceService.selectRecruitadList(vo);
			int totalRecord=list.size();
			logger.info("총 레코드 수, totalRecord={}", totalRecord);
			pagingInfo.setTotalRecord(totalRecord);
			
			model.addAttribute("list", list);
			model.addAttribute("pagingInfo", pagingInfo);
			
			logger.info("list.size={}",list.size());
			
			return "recruit/recruitlist";
	}
	
	@RequestMapping(value="advertisingwrite.do", method=RequestMethod.GET)
	public String adverwrite(@RequestParam int recruitannounceNo, Model model) {
		
		
		int call=recruitannounceService.selectadvercount(recruitannounceNo);
		int adverpaynowchek=0;
		
		if(call>0) {
			adverpaynowchek=1;
		}
		
		AdvertisingVO vo = recruitannounceService.selectadverinfo(recruitannounceNo);
		model.addAttribute("selectadverinfoVO", vo);
		model.addAttribute("adverpaynowchek", adverpaynowchek);
		logger.info("callme={}",vo);
		return "recruit/advertisingwrite";
	}
	
	@RequestMapping(value="advertisingwrite.do", method=RequestMethod.POST)
	public String adverwritego(@RequestParam int recruitannounceNo, Model model) {
		
		return "recruit/advertisingwrite";
	}
	
}
