package com.it.workit.users.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;


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
	
	@RequestMapping("/login.do")
	public String login() {
		logger.info("로그인화면");//로그인화면 출력
		return "users/login";
	}
	
	@RequestMapping("/login.do")
	public String logincheck(@ModelAttribute UsersVO vo, HttpServletRequest request,
			HttpServletResponse response, Model model) {
		//1
		logger.info("로그인 처리, 파라미터 vo={}", vo);
				
		//2
		int result=usersService.loginCheck(vo.getUserId(), vo.getUserPassword());
		logger.info("로그인 처리 결과, result={}", result);
				
		String msg="로그인 체크 실패!", url="/user/login.do";
		if(result==UsersService.LOGIN_OK) {
			//UsersVO uservo = usersService.selectMember(vo.getUserId());
			
			//[1] session
			HttpSession session=request.getSession();
			session.setAttribute("userid", vo.getUserId());
			session.setAttribute("userName", /*user*/vo.getUserName());
			
			//[2] cookie
			Cookie ck = new Cookie("ck_userid", vo.getUserId());
			ck.setPath("/");
			
			ck.setMaxAge(1000*24*60*60);

			response.addCookie(ck);
					
			msg=/*user*/vo.getUserName()+"님, 로그인되었습니다.";
			url="/index.do";
		}else if(result==UsersService.LOGIN_FAIL) {
			msg="로그인에 실패했습니다";
		}
				
		//3		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
				
		//4
		return "common/message";
	}
	
}
