package com.it.workit.indivsearch.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.indivsearch.model.IndivKeywordSearchVO;
import com.it.workit.indivsearch.model.IndivSearchService;

@Controller
@RequestMapping("/indivSearch")
public class IndivSearchController {
	private static final Logger logger=
			LoggerFactory.getLogger(IndivSearchController.class);
	
	@Autowired private IndivSearchService indivSearchServie;
	
	@RequestMapping("/indivKeywordSearch.do")
	public String indivKeyword(@RequestParam(defaultValue = "null") String keyword,
			Model model) {
		logger.info("메인 키워드 검색 보여주기 / keyword={}",keyword);
		
		if(keyword.equals("null")) {
			String msg="키워드를 입력해주세요.", url="/index.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
		List<IndivKeywordSearchVO> list=indivSearchServie.selectIndivKeyword(keyword);
		
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);
		return "indivSearch/indivKeywordSearch";
	}
}
