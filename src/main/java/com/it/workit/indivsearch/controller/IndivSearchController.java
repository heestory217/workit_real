package com.it.workit.indivsearch.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.indivsearch.model.IndivKeywordSearchVO;
import com.it.workit.indivsearch.model.IndivSearchService;
import com.it.workit.language.model.LanguageVO;

@Controller
@RequestMapping("/indivSearch")
public class IndivSearchController {
	private static final Logger logger = LoggerFactory.getLogger(IndivSearchController.class);

	@Autowired
	private IndivSearchService indivSearchServie;

	@RequestMapping("/indivKeywordSearch.do")
	public String indivKeyword(@RequestParam(defaultValue = "null") String keyword, Model model) {
		logger.info("메인 키워드 검색 보여주기 / keyword={}", keyword);

		if (keyword.equals("null")) {
			String msg = "키워드를 입력해주세요.", url = "/index.do";

			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}

		List<IndivKeywordSearchVO> list = indivSearchServie.selectIndivKeyword(keyword);

		logger.info("list.size={}", list.size());

		model.addAttribute("list", list);

		return "indivSearch/indivKeywordSearch";
	}

	@RequestMapping(value = "/indivLanguageSearch.do", method = RequestMethod.GET)
	public String indivLanguage_get(Model model) {
		logger.info("개인 - 언어 검색 보여주기 / get");

		List<LanguageVO> Llist = indivSearchServie.selectLanguage();
		logger.info("Llist.size={}", Llist.size());

		model.addAttribute("Llist", Llist);
		
		/* 기본 데이터 */
		List<IndivKeywordSearchVO> list=indivSearchServie.selectSearchAll();
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);

		return "indivSearch/indivLanguageSearch";
	}

	@RequestMapping(value = "/indivLanguageSearch.do", method = RequestMethod.POST)
	public String indivLanguage_post(Model model, @ModelAttribute IndivKeywordSearchVO vo) {
		logger.info("개인 - 언어 검색 보여주기 / post / 언어 no={}",vo.getLanguageNo());
		
		List<LanguageVO> Llist = indivSearchServie.selectLanguage();
		logger.info("Llist.size={}", Llist.size());

		model.addAttribute("Llist", Llist);
		
		List<IndivKeywordSearchVO> list = indivSearchServie.selectIndivLanguage(vo.getLanguageNo());
		logger.info("list.size={}", list.size());
		
		model.addAttribute("list", list);
		model.addAttribute("selected", vo.getLanguageNo());
		
		return "indivSearch/indivLanguageSearch";
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("/indivLanguageSearchAjax.do") public
	 * List<IndivKeywordSearchVO> indivLanguageAjax(@RequestParam int languageNo,
	 * Model model) { logger.info("개인 - 언어 AJAX / 선택 언어 ={}",languageNo);
	 * 
	 * List<IndivKeywordSearchVO>
	 * list=indivSearchServie.selectIndivLanguage(languageNo);
	 * logger.info("list.size={}",list.size());
	 * 
	 * model.addAttribute("list", list);
	 * 
	 * return list; }
	 */
}
