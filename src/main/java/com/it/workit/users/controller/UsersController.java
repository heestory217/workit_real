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
import org.springframework.web.bind.annotation.RequestMethod;
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
	
	@RequestMapping("/logincheck.do")
	public String loginck(@ModelAttribute UsersVO vo,
			@RequestParam(required = false) String chkSave, 
			HttpServletRequest request,
			HttpServletResponse response, Model model) {
		//1
				logger.info("로그인 처리, 파라미터 vo={}, chkSave={}", vo, chkSave);
				
				//2
				int result=usersService.loginCheck(vo.getUserId(), vo.getUserPassword());
				logger.info("로그인 처리 결과, result={}", result);
				
				String msg="로그인 체크 실패!", url="/users/login.do";
				if(result==UsersService.LOGIN_OK) {
					UsersVO userVo = usersService.selectUser(vo.getUserId());
					
					//[1] session
					HttpSession session=request.getSession();
					session.setAttribute("userId", vo.getUserId());
					session.setAttribute("userName", userVo.getUserName());
					session.setAttribute("userVO", userVo);
					
					//[2] cookie
					Cookie ck = new Cookie("ck_userid", vo.getUserId());
					ck.setPath("/");
					if(chkSave!=null) {
						ck.setMaxAge(1000*24*60*60);
					}else {
						ck.setMaxAge(0);	
					}
					response.addCookie(ck);
					
					msg=userVo.getUserName()+"님, 로그인되었습니다.";
					url="/index.do";
				}else if(result==UsersService.PWD_DISAGREE) {
					msg="비밀번호가 일치하지 않습니다.";
				}else if(result==UsersService.ID_NONE) {
					msg="해당 아이디가 존재하지 않습니다.";
				}
				
				//3
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);
				
				//4
				return "common/message";
	}
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String userid=(String) session.getAttribute("userid");
		logger.info("로그아웃 처리, 파라미터 userid={}", userid);
		
		session.removeAttribute("userId");
		session.removeAttribute("userName");
		
		return "redirect:/index.do";
	}
}
