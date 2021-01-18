package com.it.workit.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	//받은메세지함
	@RequestMapping("/messageBox.do")
	public void messageBox() {};
	
	@RequestMapping("/messageWrite.do")
	public String messageWrite(@RequestParam (required = false) String type) {
		logger.info("쪽지 쓰기 페이지 보여주기, 파라미터 type={}", type);
		
		return "message/messageWrite";
	};
	
	@RequestMapping("/messageBoxSend.do")
	public void messageBoxSend() {};
}
