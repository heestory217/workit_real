package com.it.workit.corpsearch.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.corp.model.AreaListView;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.LanguageListView;
import com.it.workit.corpsearch.model.CorpReSearchAllVO;
import com.it.workit.corpsearch.model.CorpSearchService;
import com.it.workit.corpsearch.model.CorpSearchkeywordConvertor;
import com.it.workit.language.model.LanguageService;
import com.it.workit.language.model.LanguageVO;
import com.it.workit.resumes.model.ResumesAllVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
public class CorpSearchController {
	private static final Logger logger = LoggerFactory.getLogger(CorpSearchController.class);
	
	@Autowired private CorpSearchService searchService;
	@Autowired private CorpService corpService;
	@Autowired private UsersService userSerivce;
	@Autowired private CorpSearchkeywordConvertor CSKConvertor;
	@Autowired private LanguageService langService;
	
	@RequestMapping("/corpSearch.do")
	public String searchMain(@ModelAttribute CorpReSearchAllVO searchVo, Model model) {
		logger.info("검색 화면에 들어온 SearchVO = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(5);
		pagingInfo.setRecordCountPerPage(12);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(12);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		String searchKeyword = searchVo.getSearchKeyword();
		searchKeyword = CSKConvertor.CSKConvertor(searchKeyword);
		searchVo.setSearchKeyword(searchKeyword);
		
		List<ResumesAllVO> resumeList = searchService.searchDefault(searchVo);
		
		for(ResumesAllVO vo:resumeList) {
			int resumeNo = vo.getResumesVo().getResumeNo();
			List<LanguageListView> langList = corpService.selectLanguageList(resumeNo);
			List<AreaListView> areaList = corpService.selectAreaList(resumeNo);
			int userNoForResume = vo.getResumesVo().getUserNo();
			UsersVO userVo = userSerivce.selectByUserNo(userNoForResume);
			String userExp = userVo.getUserExperience();
			vo.setAreaList(areaList);
			vo.setLangList(langList);
			vo.setUserExperience(userExp);
		}
		int totalRecord=searchService.selectTotalRecord(searchVo);
		logger.info("전체 글 갯수 : {}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<LanguageVO> langList = langService.selectAllLang();
		List<Integer> langNo = searchVo.getLangNo();
		model.addAttribute("langNo", langNo);
		model.addAttribute("langlist",langList);
		model.addAttribute("resumeList",resumeList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "company/corpSearch/searchMain";
	}
	
}
