package com.it.workit.admin.adminusers.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/adminusers/login")
public class AdminUsersController {
	private static final Logger logger = LoggerFactory.getLogger( AdminUsersController.class);
	
	
	@RequestMapping("/login.do")
	public String login() {
		logger.info("로그인화면");//로그인화면 출력
		return "admin/login/login";
	}
	
	/*
	 @ResponseBody
	@RequestMapping("/loginajax.do")
	public String[] loginajax(@RequestParam("userId") String userId, @RequestParam("password") String password, HttpServletRequest request,
			@RequestParam(required = false) String savepass, HttpServletResponse response) {
		logger.info("로그인 채크 userId = {}, password= {}", userId, password);

		int result=usersService.loginCheck(userId, password);
		logger.info("로그인 처리 결과, result={}", result);

		String result2=Integer.toString(result);
		String[] avx = new String[2];
		avx[0]=result2;

		if(result==UsersService.LOGIN_OK) {
			UsersVO vo = usersService.selectByUserId(userId);

			int kind=usersService.userkindcheck(userId);

			//[1] session
			HttpSession session=request.getSession();
			session.setAttribute("userId", vo.getUserId());
			session.setAttribute("userNo", vo.getUserNo());
			session.setAttribute("userName", vo.getUserName());
			logger.info("회원종류={}", kind);
			session.setAttribute("user_corpcheck", kind);


			if(vo.getUserCorpcheck()==1){
				List<Date> seervcheck=ordersService.selectorderscall(vo.getUserNo());
				logger.info("로그인 처리 결과, 회원권 구매결과={}", seervcheck);
				logger.info("갯수 {}", seervcheck.size());
				int t =seervcheck.size();
				Date d = new Date();

				if(t>0) {
					for(int i=0; i<t; i++) {
						int compare=d.compareTo(seervcheck.get(i));
						if(compare<0) {
							logger.info("이용권존재함");
							session.setAttribute("seervcheck", seervcheck.get(i));
							break;
						}
					}
				}
			}


			avx[1]=vo.getUserName();
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
