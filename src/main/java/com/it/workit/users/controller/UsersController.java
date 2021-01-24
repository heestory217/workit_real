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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@RequestMapping("/checkEmail.do")
	public String email() {
		logger.info("이메일 인증화면 보여주기");

		return "users/checkEmail";
	}

	@RequestMapping("/usersWrite.do")
	public String write(@ModelAttribute UsersVO vo, ModelMap model) {
		logger.info("회원가입 등록 파라미터 vo={}",vo);

		String hp1=vo.getUserHp1();
		String hp2=vo.getUserHp2();
		String hp3=vo.getUserHp3();

		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			hp1="";
			hp2="";
			hp3="";
		}

		vo.setUserHp1(hp1);
		vo.setUserHp2(hp2);
		vo.setUserHp3(hp3);

		String email1=vo.getUserEmail1();
		String email2=vo.getUserEmail2();

		if(email1==null || email1.isEmpty() || email2==null || email2.isEmpty()) {
			email1="";
			email2="";
		}

		vo.setUserEmail1(email1);
		vo.setUserEmail2(email2);

		int cnt=usersService.insertUsers(vo);

		logger.info("회원가입 결과, cnt={}", cnt);

		String msg="회원가입 실패!", url="/users/register.do";
		if(cnt>0) {
			msg="회원가입되었습니다.";
			url="/index.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";

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

	@ResponseBody
	@RequestMapping("/ajaxCheckId.do")
	public boolean ajaxCheckId(@RequestParam String userid) {
		logger.info("ajax 이용한 아이디 중복확인, userid = {}", userid);

		boolean bool=false;
		int result=usersService.checkDup(userid);
		logger.info("아이디 중복확인 결과, result={}", result);

		if(result==UsersService.EXIST_ID) {
			bool=true;  //사용 불가(이미 존재)
		}else if(result==UsersService.NON_EXIST_ID) {
			bool=false;	//사용 가능
		}

		return bool;
	}

	@RequestMapping("/login.do")
	public String login() {
		logger.info("로그인화면");//로그인화면 출력
		return "users/login";
	}

	@RequestMapping("/logincheck.do")
	public String loginck(@ModelAttribute UsersVO vo, HttpServletRequest request, Model model,
			@RequestParam(required = false) String savepass, HttpServletResponse response) {
		//1
				logger.info("로그인 처리, 파라미터 vo={}", vo);

				//2
				int result=usersService.loginCheck(vo.getUserId(), vo.getUserPassword());
				logger.info("로그인 처리 결과, result={}", result);

				String msg="로그인 체크 실패!", url="/users/login.do";
				
				if(result==UsersService.LOGIN_OK) {
					UsersVO userVo = usersService.selectByUserId(vo.getUserId());
					logger.info("userVo={}", vo);
					
					int kind=usersService.userkindcheck(vo.getUserId());
					
					//[1] session
					HttpSession session=request.getSession();
					session.setAttribute("userId", vo.getUserId());
					session.setAttribute("userNo", userVo.getUserNo());
					session.setAttribute("userName", userVo.getUserName());
					logger.info("회원종류={}", kind);
					session.setAttribute("user_corpcheck", kind);
					
					
					msg=userVo.getUserName()+"님, 로그인되었습니다.";
					url="/index.do";
				}else if(result==UsersService.PWD_DISAGREE) {
					msg="비밀번호가 일치하지 않습니다.";
				}else if(result==UsersService.ID_NONE) {
					msg="해당 아이디가 존재하지 않습니다.";
				}
				
				//[2] cookie
				Cookie ck = new Cookie("ck_userid", vo.getUserId());
				ck.setPath("/");
				if(savepass!=null) {
					ck.setMaxAge(1000*24*60*60);
				}else {
					ck.setMaxAge(0);
				}
				response.addCookie(ck);

				//3
				model.addAttribute("msg", msg);
				model.addAttribute("url", url);

				//4
				return "common/message";
	}
	
	
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
	
	

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		String userid=(String) session.getAttribute("userid");
		logger.info("로그아웃 처리, 파라미터 userid={}", userid);

		session.removeAttribute("userId");
		session.removeAttribute("userNo");
		session.removeAttribute("userName");
		session.removeAttribute("user_corpcheck");

		return "redirect:/index.do";
	}
}
