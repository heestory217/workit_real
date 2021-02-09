package com.it.workit.admin.adminusers.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.admin.adminusers.model.AdminUsersService;
import com.it.workit.admin.adminusers.model.AdminUsersVO;

@Controller
@RequestMapping("/admin/adminusers")
public class AdminUsersController {
	private static final Logger logger = LoggerFactory.getLogger( AdminUsersController.class);
	
	//@Autowired private AdminUsersService adminusersService;
	
	@RequestMapping("/login.do")
	public String login() {
		logger.info("로그인화면");//로그인화면 출력
		return "admin/adminusers/login";
	}
	
	/*
	@ResponseBody
	@RequestMapping("/loginajax.do")
	public String[] loginajax(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpServletRequest request,
			@RequestParam(required = false) String savepass, HttpServletResponse response) {
		logger.info("로그인 채크 userId = {}, password= {}", userId, password);

		int result=adminusersService.loginCheck(userId, password);
		logger.info("로그인 처리 결과, result={}", result);

		String result2=Integer.toString(result);
		String[] avx = new String[2];
		avx[0]=result2;

		if(result==AdminUsersService.LOGIN_OK) {
			AdminUsersVO vo = adminusersService.selectByUserId(userId);

			//[1] session
			HttpSession session=request.getSession();
			session.setAttribute("userId", vo.getManagerId());
			session.setAttribute("userNo", vo.getManagerNo());
			session.setAttribute("userName", vo.getManagerName());


			avx[1]=vo.getManagerName();
		}

		//[2] cookie
		Cookie ck = new Cookie("ck_userid", userId);
		ck.setPath("/");
		if(savepass!=null) {
			ck.setMaxAge(1000*24*60*60);
		}else {
			ck.setMaxAge(0);
		}
		response.addCookie(ck);
		logger.info("쿠키={}", savepass);
		//4
		return avx;
	}
	*/
}
