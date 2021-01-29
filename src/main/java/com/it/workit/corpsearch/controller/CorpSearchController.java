package com.it.workit.corpsearch.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
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
	@Autowired private ResumesService resumeService;
	@Autowired private CorpService corpService;
	@Autowired private UsersService userSerivce;
	
	@RequestMapping("/corpSearch.do")
	public String searchMain(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("검색 화면에 들어온 SearchVO = {}", searchVo);
		
		//검색으로 원하는 resumeNo찾기
		List<Integer> resumeNoList = searchService.searchDefault(searchVo);
		logger.info("검색 결과로 찾은 resumeNOList = {}", resumeNoList.size());
		
		//찾은 resmueNo로 페이징 처리만(검색어로 걸러진 이력서들로 이미 유지된 상태임)
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(12);
		
		//매칭된 이력서 번호+!페이징처리!를 넣어서 해당 이력서의 상세 정보 
		List<ResumesAllVO> resumeList=resumeService.searchResumeByNo(resumeNoList);
		
		// 언어리스트+경력 검색
		logger.info("이력서 번호로 조회한 이력서 리스트의 갯수 : {}",resumeList.size());
		for(ResumesAllVO vo : resumeList) {
			int resumeNo=vo.getResumesVo().getResumeNo();
			List<LanguageListView> langList = corpService.selectLanguageList(resumeNo);
			int userNoForResume=vo.getResumesVo().getUserNo();
			UsersVO userVo = userSerivce.selectByUserNo(userNoForResume);
			String userExp = userVo.getUserExperience();
			vo.setLangList(langList);
			vo.setUserExperience(userExp);
		}
		model.addAttribute("resumeList",resumeList);
		
		return "company/corpSearch/searchMain";
	}
}
