package com.it.workit.admin.recruit.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.users.model.UsersService;

@Controller
@RequestMapping("/admin/users/corp")
public class AdminRecruitController {
	private static final Logger logger=LoggerFactory.getLogger(AdminRecruitController.class);

	@Autowired private UsersService usersService;
	
	
	@RequestMapping("/recruitList.do")
	public String recruitList() {
		logger.info("관리자 채용공고 목록");

		return "/admin/users/corp/recruitList";
	}
	
	@RequestMapping("/recruitDetail.do")
	public String recruitDetail() {
		logger.info("관리자 채용공고 목록");

		return "/admin/users/corp/recruitDetail";
	}
}