package com.it.workit.message.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.message.model.MessageService;
import com.it.workit.message.model.MessageVO;

@Controller
@RequestMapping("/message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired
	private MessageService messageService;
	
	//받은메세지함
	@RequestMapping("/messageBox.do")
	public String messageBox(@RequestParam (required = false) String type) {
		logger.info("쪽지 수신함 페이지 보여주기, 파라미터 type={}", type);

		//일반 편지를 받은경우
		//db로직처리 후 보여주기
		
		if(type!=null && !type.isEmpty()) {
			if(type.equals("toMe")) {
				//나에게 쓴 편지일경우
				
			}else if(type.equals("important")) {
				//중요편지인경우 (편지보관함)
				//db로직처리 후 보여주기
				
			}
		}
		
		
		return "message/messageBox";
	};
	
	@RequestMapping(value="/messageWrite.do", method = RequestMethod.GET)
	public String messageWrite(@RequestParam (required = false) String type) {
		logger.info("쪽지 쓰기 페이지 보여주기, 파라미터 type={}", type);
		
		return "message/messageWrite";
	};
	
	@RequestMapping(value="/messageWrite.do", method = RequestMethod.POST)
	public String messageWrite_post(@ModelAttribute MessageVO vo,
			@RequestParam (required = false) String userId, Model model) {
		
		logger.info("쪽지 쓰기 처리, 파라미터 vo={} ={}", vo);
		logger.info("쪽지 쓰기 처리, 파라미터 userId={}", userId);
		
		//db처리
		int cnt = messageService.insertMessage(vo);
		String msg="쪽지 전송 실패", url="/message/messageWrite.do";
		if(cnt>0) {
			//유저아이디가 없는 경우 => 나에게 보내는 쪽지
			//직접입력한 아이디가 내 아이디와 같은 경우 처리 => ||userId.equals(세션아이디) 추가하기
			if(userId==null || userId.isEmpty()) {
				msg = "나에게 쪽지를 전송하였습니다. [나에게 쓴 쪽지함]에 저장됩니다.";
			}else {
				msg = userId+"님에게 쪽지를 전송하였습니다.";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	};
	
	@RequestMapping("/messageBoxSend.do")
	public String messageBoxSend(HttpSession session, ModelMap model) {
		//세션에서 받아오기 userNo
		//int userNo = (Integer) session.getAttribute("userNo");
		//logger.info("보낸 쪽지함 조회, userNo={}", userNo);
		
		//임시로 값 지정해준 것
		int userNo=1;
		
		//db
		List<MessageVO> list = messageService.selectSentMessage(userNo);
		logger.info("쪽지함 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "message/messageBoxSend";
	};
	
	@RequestMapping(value="/messageDetail.do", method = RequestMethod.GET)
	public void messageDetail() {};
	
}
