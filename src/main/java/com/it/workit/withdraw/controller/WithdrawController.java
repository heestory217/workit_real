package com.it.workit.withdraw.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/users")
public class WithdrawController {
	private static final Logger logger
		= LoggerFactory.getLogger(WithdrawController.class);
	
	@Autowired UsersService userService;
	@RequestMapping("/withdraw.do")
	public void withdraw() {
		logger.info("회원 탈퇴 화면");
	}

	@RequestMapping(value="/withdraw.do", method=RequestMethod.POST)
	public String withdraw_post(@RequestParam(defaultValue = "0") String userPassword,
			HttpSession session, HttpServletResponse response, 
			Model model) {
		String userId=(String) session.getAttribute("userId");
		logger.info("회원 탈퇴 처리, 파라미터 userPassword={}", userPassword);
		
		//비밀번호 체크
		int loginResult = userService.loginCheck(userId, userPassword);
		
		//비밀번호 체크
		String msg="", url="";
		if(loginResult==userService.LOGIN_OK) {
			int cnt = userService.updateEnddate(userId);
			if(cnt>0) {
				msg="회원탈퇴가 정상적으로 이루어졌습니다.\\n그동안 WORK IT을 이용해주셔서 감사합니다.";
				url="/index.do";
				
				//[1] 세션 정보 삭제
				session.removeAttribute("userId");
				session.removeAttribute("userName");
				session.removeAttribute("userNo");
				
				//[2] 쿠키 삭제
				Cookie ck = new Cookie("ck_userid", userId);
				ck.setPath("/");
				ck.setMaxAge(0); 
				response.addCookie(ck);
			}
		}else {
			msg="회원정보와 입력하신 정보가 일치하지 않습니다. 다시 확인해 주세요.";
			url="/users/withdraw.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
}
