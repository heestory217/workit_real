package com.it.workit.corpsearch.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CorpSearchController {
	
	@RequestMapping("/corpSearch.do")
	public String searchMain() {
		return "company/corpSearch/searchMain";
	}
}
