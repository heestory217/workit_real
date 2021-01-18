package com.it.workit.users.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.users.model.UsersService;


@Controller
@RequestMapping("/users")
public class UsersController {
	private static final Logger logger
		=LoggerFactory.getLogger(UsersController.class);
	
	@Autowired private UsersService usersService;
	
	@RequestMapping("/register.do")
	public String register() {
		logger.info("개인회원 회원가입 화면 보여주기");
		
		return "users/register";
	}
	
	@RequestMapping("/checkId.do")
	public String checkId(@RequestParam String userid, Model model) {
		logger.info("아이디 중복 확인, userid = {}",userid);
		
		int result=0;
		if(userid!=null && !userid.isEmpty()) {
			result=usersService.checkDup(userid);
			logger.info("아이디 중복확인 결과, result={}", result);
		}
		
		model.addAttribute("result", result);
		model.addAttribute("EXIST_ID", UsersService.EXIST_ID);
		model.addAttribute("NON_EXIST_ID", UsersService.NON_EXIST_ID);

		return "users/checkId";
	}
}
