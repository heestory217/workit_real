package com.it.workit.companyMypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.indivMypage.controller.IndivMypageController;

@Controller
@RequestMapping("/companyMypage")
public class CompanyMypageController {
	private static final Logger logger =LoggerFactory.getLogger(IndivMypageController.class);

	@RequestMapping("/companyPayment.do")
	public void companyPayment() {}
}
