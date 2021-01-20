package com.it.workit.users.controller;

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
}
