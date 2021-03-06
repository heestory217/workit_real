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
import com.it.workit.question.model.WorkkindVO;
import com.it.workit.users.model.arealistVO;

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


	@RequestMapping(value = "/indivExplore.do", method = RequestMethod.GET)
	public String indivExplore_get(Model model) {
		logger.info("개인 - 채용 공고 탐색 보여주기 / get");
		/* 언어 기본데이터 */
		List<LanguageVO> Llist = indivSearchServie.selectLanguage();
		logger.info("Llist.size={}", Llist.size());

		model.addAttribute("Llist", Llist);

		/* 지역 기본데이터 */
		List<arealistVO> Alist = indivSearchServie.selectAreaList1();
		logger.info("Alist.size={}", Alist.size());

		model.addAttribute("Alist", Alist);

		/* 기본 데이터 - 선택 X */
		List<IndivKeywordSearchVO> list = indivSearchServie.selectSearchAll();
		logger.info("list.size={}", list.size());

		model.addAttribute("list", list);

		return "indivSearch/indivExplore";
	}

	@RequestMapping(value = "/indivExplore.do", method = RequestMethod.POST)
	public String indivExplore_post(Model model, @ModelAttribute IndivKeywordSearchVO vo) {
		logger.info("개인 - 채용 공고 탐색 보여주기 / post / 지역1={}, 지역2={}", vo.getAreaAdd1(), vo.getAreaAdd2());
		logger.info("개인 - 채용 공고 탐색 보여주기 / post / 언어 no={}, 경력={}", vo.getLanguageNo(), vo.getIndivCareer());

		model.addAttribute("A1selected", vo.getAreaAdd1());
		model.addAttribute("A2selected", vo.getAreaAdd2());
		model.addAttribute("Lselected", vo.getLanguageNo());
		model.addAttribute("Cselected", vo.getIndivCareer());

		/* 언어 기본데이터 */
		List<LanguageVO> Llist = indivSearchServie.selectLanguage();
		logger.info("Llist.size={}", Llist.size());

		model.addAttribute("Llist", Llist);

		/* 지역 기본데이터 */
		List<arealistVO> Alist = indivSearchServie.selectAreaList1();
		logger.info("Alist.size={}", Alist.size());

		model.addAttribute("Alist", Alist);

		List<IndivKeywordSearchVO> list = null;
		if (vo.getAreaAdd2().equals("전체")) { // areaAdd2가 전체일때
			list = indivSearchServie.selectExploreAll(vo);
		} else {
			list = indivSearchServie.selectExplore(vo);
		}

		logger.info("list.size={}", list.size());

		model.addAttribute("list", list);

		/* ajax area2 값 세팅 */
		List<arealistVO> area2list = indivSearchServie.selectAreaList2(vo.getAreaAdd1());
		logger.info("area2list.size={}", area2list.size());
		model.addAttribute("area2list", area2list);

		return "indivSearch/indivExplore";
	}


	@ResponseBody
	@RequestMapping("/indivLanguageSearchAjax.do")
	public List<arealistVO> indivArea2Ajax(@RequestParam String areaAdd1, Model model) {
		logger.info("개인 - 지역2 AJAX / 선택 area1 ={}", areaAdd1);
		List<arealistVO> area2list = indivSearchServie.selectAreaList2(areaAdd1);
		logger.info("area2list.size={}", area2list.size());
		model.addAttribute("area2list", area2list);

		return area2list;
	}

	@RequestMapping(value = "/indivExploreWorkkind.do", method = RequestMethod.GET)
	public String indivExploreWorkkind_get(Model model, @RequestParam(defaultValue = "0") int workkindno) {
		logger.info("개인 - 채용 공고 탐색 보여주기 / get, workkindno={}", workkindno);
		model.addAttribute("wselected", workkindno);
		
		/* 직무 데이터 */
		List<WorkkindVO> wlist = indivSearchServie.selectWorkkind();
		logger.info("wlist.size={}", wlist.size());

		model.addAttribute("wlist", wlist);

		List<IndivKeywordSearchVO> list = null;
		if (workkindno <= wlist.size() && workkindno > 0) {
			list = indivSearchServie.selectExploreWorkKind(workkindno);
		} else {
			/* 기본 데이터 - 선택 X */
			list = indivSearchServie.selectSearchAll();
		}
		logger.info("list.size={}", list.size());

		model.addAttribute("list", list);

		return "indivSearch/indivExploreWorkkind";
	}

}
