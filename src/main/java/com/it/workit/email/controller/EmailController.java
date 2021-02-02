package com.it.workit.email.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String sendFindId(Model model, @RequestParam String userEmail) {
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
			String content="<h1>[WorkIT] 회원님의 아이디는</h1> <h3>[ "+userId+" ]</h3> 입니다.";
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
}
