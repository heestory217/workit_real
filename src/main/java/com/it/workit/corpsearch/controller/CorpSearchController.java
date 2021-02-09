package com.it.workit.corpsearch.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.common.PaginationInfo;
import com.it.workit.corp.model.AreaListView;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.LanguageListView;
import com.it.workit.corpsearch.model.CorpReSearchAllVO;
import com.it.workit.corpsearch.model.CorpSearchService;
import com.it.workit.corpsearch.model.CorpSearchkeywordConvertor;
import com.it.workit.indivsearch.model.IndivSearchService;
import com.it.workit.language.model.LanguageService;
import com.it.workit.language.model.LanguageVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.resumes.model.ResumesAllVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;
import com.it.workit.users.model.arealistVO;

@Controller
public class CorpSearchController {
	private static final Logger logger = LoggerFactory.getLogger(CorpSearchController.class);
	
	@Autowired private CorpSearchService searchService;
	@Autowired private CorpService corpService;
	@Autowired private UsersService userSerivce;
	@Autowired private CorpSearchkeywordConvertor CSKConvertor;
	@Autowired private LanguageService langService;
	@Autowired private IndivSearchService indivSearchServie;
	@Autowired private OrdersService orderService;
	
	@RequestMapping("/corpSearch.do")
	public String searchMain(@ModelAttribute CorpReSearchAllVO searchVo, HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("검색 화면에 들어온 SearchVO = {}, userNo{}", searchVo,userNo);
		
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
		List<Map<String, Object>> buyingList = orderService.selectPurchasedResume(userNo);
		logger.info("구매이력서 내역 size={}",buyingList.size());
		
		for(ResumesAllVO vo:resumeList) {
			int resumeNo = vo.getResumesVo().getResumeNo();
			if(!buyingList.isEmpty()) {
				for(int i=0; i<buyingList.size(); i++) {
					int buyingNo=Integer.parseInt(String.valueOf(buyingList.get(i).get("RESUME_NO")));
					if(buyingNo==resumeNo) {
						vo.setBuyChk(1);
					}
				}
			}
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

		//지역 데이터 
		List<arealistVO> Alist=indivSearchServie.selectAreaList1();
		
		model.addAttribute("Alist",Alist);
		model.addAttribute("langNo", langNo);
		model.addAttribute("langlist",langList);
		model.addAttribute("resumeList",resumeList);
		model.addAttribute("pagingInfo",pagingInfo);
		
		return "company/corpSearch/searchMain";
	}
	
}
