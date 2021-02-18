package com.it.workit.admin.managers.controller;

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

import com.it.workit.admin.managers.model.ManagersService;
import com.it.workit.admin.managers.model.ManagersVO;

@Controller
@RequestMapping("/managers")
public class ManagersController {
	private static final Logger logger = LoggerFactory.getLogger( ManagersController.class);
	
	@Autowired private ManagersService managersService;
	
	@RequestMapping("/login.do")
	public String login() {
		logger.info("로그인화면");//로그인화면 출력
		return "managers/login";
	}
	
	
	@ResponseBody
	@RequestMapping("/loginajax.do")
	public String[] loginajax(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpServletRequest request,
			@RequestParam(required = false) String savepass, HttpServletResponse response) {
		logger.info("로그인 채크 userId = {}, password= {}", userId, password);

		int result=managersService.loginCheck(userId, password);
		logger.info("로그인 처리 결과, result={}", result);

		String result2=Integer.toString(result);
		String[] avx = new String[2];
		avx[0]=result2;

		if(result==ManagersService.LOGIN_OK) {
			ManagersVO vo = managersService.selectByManagersId(userId);

			//[1] session
			HttpSession session=request.getSession();
			session.setAttribute("managerId", vo.getManagerId());
			session.setAttribute("managerNo", vo.getManagerNo());
			session.setAttribute("managerName", vo.getManagerName());
			
			logger.info("관리자로그인={}", vo);
			
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
	
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String userid=(String) session.getAttribute("managerId");
		logger.info("로그아웃 처리, 파라미터 userid={}", userid);

		session.removeAttribute("managerId");
		session.removeAttribute("managerNo");
		session.removeAttribute("managerName");

		return "redirect:/managers/login.do";
	}
}
