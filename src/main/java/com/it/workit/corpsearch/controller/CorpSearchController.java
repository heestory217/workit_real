package com.it.workit.corpsearch.controller;

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
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.LanguageListView;
import com.it.workit.corpsearch.model.CorpSearchService;
import com.it.workit.resumes.model.ResumesAllVO;
import com.it.workit.resumes.model.ResumesService;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
public class CorpSearchController {
	private static final Logger logger = LoggerFactory.getLogger(CorpSearchController.class);
	
	@Autowired private CorpSearchService searchService;
	@Autowired private CorpService corpService;
	@Autowired private UsersService userSerivce;
	
	@RequestMapping("/corpSearch.do")
	public String searchMain(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("검색 화면에 들어온 SearchVO = {}", searchVo);
		
		//검색으로 원하는 resumeNo찾기
		
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(12);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(12);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<ResumesAllVO> resumeList = searchService.searchDefault(searchVo);
		logger.info("검색 결과로 찾은 resumeList = {}", resumeList.size());
		for(ResumesAllVO vo:resumeList) {
			int resumeNo = vo.getResumesVo().getResumeNo();
			logger.info("for에 들어온 resumeNo ={}", resumeNo);
			List<LanguageListView> langList = corpService.selectLanguageList(resumeNo);
			int userNoForResume = vo.getResumesVo().getUserNo();
			logger.info("for에 들어온 userNo ={}", resumeNo);
			UsersVO userVo = userSerivce.selectByUserNo(userNoForResume);
			String userExp = userVo.getUserExperience();
			vo.setLangList(langList);
			vo.setUserExperience(userExp);
		}
		int totalRecord=searchService.selectTotalRecord(searchVo);
		logger.info("전체 글 갯수 : {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("resumeList",resumeList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "company/corpSearch/searchMain";
	}
}
