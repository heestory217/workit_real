package com.it.workit.email.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.email.EmailSender;
import com.it.workit.users.model.UsersService;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger=
		LoggerFactory.getLogger(EmailController.class);
	
	@Autowired private EmailSender emailSender;
	@Autowired private UsersService userService;
	
	@RequestMapping("/send.do")
	public String send(Model model, @RequestParam String email) {
		logger.info("이메일 발송 - 회원가입");
		
		Random random=new Random(System.currentTimeMillis());
		int result=10000+random.nextInt(10000);
		
		String subject="[ WorkIT ] 인증번호 입니다. 확인 부탁드립니다!";
		String content="<h1>[WorkIT] 인증번호</h1> <h3>[ "+result+" ]</h3> 괄호 안의 숫자를 입력해주세요.";
		String receiver=email;	//받는 사람의 이메일 주소
		String sender="workit2022@gmail.com";	//보내는 사람의 이메일 주소
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공!");
			model.addAttribute("result", 1);
			model.addAttribute("number", result);
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!");
			model.addAttribute("result", 2);
			e.printStackTrace();
		}
		return "/users/checkEmail";
	}
	
	@RequestMapping("/findId.do")
	public String sendFindId(@RequestParam String userEmail, Model model) {
		logger.info("이메일 발송 - 아이디 찾기");
		
		String[] emailPart = userEmail.split("@"); // [oh, gmail.com]
		Map<String, Object> eMailMap = new HashMap<String, Object>();
		 
		eMailMap.put("email1", emailPart[0]);
		eMailMap.put("email2", emailPart[1]);
		
		String userId = userService.findId(eMailMap);
		logger.info("userId = {}", userId);
		String url ="", msg="";
		if(userId!=null && userId!="") {
			String subject="[ WorkIT ] 아이디 분실";
			String content="<h1>[WorkIT]</h1> <h3> 회원님의 아이디는 [ "+userId+" ]</h3> 입니다.";
			String receiver=userEmail;	//받는 사람의 이메일 주소
			String sender="workit2022@gmail.com";	//보내는 사람의 이메일 주소
			try {
				emailSender.sendEmail(subject, content, receiver, sender);
				logger.info("이메일 발송 성공!");
				msg="입력하신 이메일로 아이디가 전송되었습니다.";
				url="/users/login.do";
			} catch (MessagingException e) {
				logger.info("이메일 발송 실패!");
				e.printStackTrace();
			}
		}else {
			logger.info("없는 아이디입니다.");
			msg="등록되지 않은 회원입니다.";
			url="/users/findIdPw.do";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping(value="/findPwd.do",  method=RequestMethod.POST)
	public String sendFindPwd(HttpServletRequest request, Model model) {
		String userId = request.getParameter("userId");
		String userEmail = request.getParameter("userEmail");
		logger.info("userID={}",userId);
		logger.info("userEmail={}",userEmail);
		
		String[] emailPart = userEmail.split("@"); // [oh, gmail.com]
		
		Map<String, Object> findPwdMap = new HashMap<String, Object>();
		findPwdMap.put("userId", userId);
		findPwdMap.put("email1", emailPart[0]);
		findPwdMap.put("email2", emailPart[1]);
		
		int cnt = userService.findPwd(findPwdMap);
		logger.info("회원 비밀번호 조회 결과 cnt ={}", cnt);
		
		
		String url ="", msg="";
		if(cnt==1) {
			Random random=new Random(System.currentTimeMillis());
			int result=10000+random.nextInt(10000);
			int tempPwd=result;
			logger.info("비밀번호 재설정1 tempPwd={}",tempPwd);
			Map<String, Object> tempUser = new HashMap<String, Object>();
			tempUser.put("userId",userId);
			tempUser.put("tempPwd",tempPwd);
			int updateCnt = userService.updatePwd(tempUser);
			logger.info("비밀번호 재설정 updateCnt={}",updateCnt);
			if(updateCnt==1) {
				String subject="[ WorkIT ] 비밀번호 재설정";
				String content="<h1>[WorkIT]</h1><h3> 회원님의 임시비밀번호는 [ "+tempPwd+" ] 입니다.</h3>";
				logger.info("비밀번호 재설정1 tempPwd={}",tempPwd);
				content+="<a href='http://localhost:9090/workit/users/tempPwdUpdate.do'>비밀번호 재설정 바로가기</a>";
				String receiver=userEmail;	//받는 사람의 이메일 주소
				String sender="workit2022@gmail.com";	//보내는 사람의 이메일 주소
				try {
					emailSender.sendEmail(subject, content, receiver, sender);
					logger.info("이메일 발송 성공!");
					msg="입력하신 이메일로 비밀번호 재설정 페이지가 전송되었습니다.";
					url="/users/login.do";
				} catch (MessagingException e) {
					logger.info("이메일 발송 실패!");
					e.printStackTrace();
				}
			}else {
				logger.info("비밀번호 재설정 실패");
				msg="비밀번호 재설정에 실패했습니다.";
			}
		}else {
			msg="입력하신 정보와 일치하는 계정이 없습니다.";
			url="/users/findIdPw.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
}
