package com.it.workit.admin.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.getmessage.model.GetMessageService;
import com.it.workit.getmessage.model.GetMessageVO;
import com.it.workit.message.model.MessageService;
import com.it.workit.message.model.MessageVO;

@Controller
@RequestMapping("/admin")
public class adminMessageController {
	private static final Logger logger = LoggerFactory.getLogger(adminMessageController.class);
	
	@Autowired private MessageService messageService;
	@Autowired private GetMessageService getMessageService;
	
	@RequestMapping("/message/sendMessage.do")
	public void sendMsgView(@RequestParam String corpName, @RequestParam int userNo, Model model) {
		logger.info("corpName={}, userNo={}", corpName, userNo);
		model.addAttribute("corpName", corpName);
		model.addAttribute("userNo", userNo);
	}
	
	@ResponseBody
	@RequestMapping("/message/sendMessageAjax.do")
	public int sendMsg(@ModelAttribute MessageVO vo) {
		vo.setUserNo(999);
		int cnt = messageService.insertMessage(vo);
		logger.info("MessageVO={}", vo);
		
		if(cnt>0) {
			GetMessageVO gVo =  new GetMessageVO();
			
			gVo.setUserNo(vo.getUserNo());
			gVo.setMessageNo(vo.getMessageNo());
			logger.info("GetMessageVO={}", gVo);
			cnt = getMessageService.insertGetMessage(gVo);
		}
		
		return cnt;
	}
}
