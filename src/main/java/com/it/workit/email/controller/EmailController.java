package com.it.workit.email.controller;

import java.util.Random;

import javax.mail.MessagingException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.email.EmailSender;

@Controller
@RequestMapping("/email")
public class EmailController {
	private static final Logger logger=
		LoggerFactory.getLogger(EmailController.class);
	
	@Autowired private EmailSender emailSender;
	
	@RequestMapping("/send.do")
	public String send() {
		logger.info("이메일 발송 - 회원가입");
		
		Random random=new Random(System.currentTimeMillis());
		int result=10000+random.nextInt(10000);
		
		String subject="[ WorkIT ] 인증번호 입니다. 확인 부탁드립니다!";
		String content="<h1>[WorkIT] 인증번호</h1> <h3>[ "+result+" ]</h3> 괄호 안의 숫자를 입력해주세요.";
		String receiver="workit2022@gmail.com";	//받는 사람의 이메일 주소
		String sender="workit2022@gmail.com";	//보내는 사람의 이메일 주소
		
		try {
			emailSender.sendEmail(subject, content, receiver, sender);
			logger.info("이메일 발송 성공!");
		} catch (MessagingException e) {
			logger.info("이메일 발송 실패!");
			e.printStackTrace();
		}
		
		return "redirect:/users/register.do";
	}
}
