package com.it.workit.message.controller;

import java.util.List;
import java.util.Map;

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

import com.it.workit.getmessage.model.GetMessageService;
import com.it.workit.getmessage.model.GetMessageVO;
import com.it.workit.message.model.MessageService;
import com.it.workit.message.model.MessageVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/message")
public class MessageController {
	private static final Logger logger = LoggerFactory.getLogger(MessageController.class);
	
	@Autowired private MessageService messageService;
	@Autowired private GetMessageService getMessageService;
	@Autowired private UsersService userService;
	
	//받은메세지함
	@RequestMapping("/messageBox.do")
	public String messageBox(@RequestParam (required = false) String type,
			Model model) {
		logger.info("쪽지 수신함 페이지 보여주기, 파라미터 type={}", type);

		//세션에서 받아오기 userNo
		//int userNo = (Integer) session.getAttribute("userNo");
		//logger.info("내가 보낸 쪽지함 조회, userNo={}", userNo);
		int userNo = 1;
		
		List<Map<String, Object>> getList = null;
		
		if(type!=null && !type.isEmpty()) {
			if(type.equals("toMe")) {
				//나에게 쓴 편지일경우
				getList = messageService.selectSentMyself(userNo);
			}else if(type.equals("important")) {
				//중요편지인경우 (편지보관함)
				getList = messageService.selectImpMessage(userNo);
			}
		}else {
			//(내가)받은 편지함 조회
			getList = messageService.selectGetMessage(userNo);
			
		}
		logger.info("쪽지 조회 결과, getList.size={}", getList.size());
		
		model.addAttribute("getList", getList);
		
		return "message/messageBox";
	};
	
	@RequestMapping(value="/messageWrite.do", method = RequestMethod.GET)
	public String messageWrite(HttpSession session, 
			@RequestParam (required = false) String type,
			Model model) {
		logger.info("쪽지 쓰기 페이지 보여주기, 파라미터 type={}", type);
		String userId = (String) session.getAttribute("userId");
		
		model.addAttribute("userId", userId);
		
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
			if(userId==null || userId.isEmpty()) {
				//유저아이디가 없는 경우 => 나에게 보내는 쪽지
				userId="kim";
				//직접입력한 아이디가 내 아이디와 같은 경우 처리 
				//userId = 세션아이디
				msg = "쪽지를 성공적으로 보냈습니다.\\n\\n나에게 쓴 쪽지는 [나에게 쓴 쪽지함]에서 확인할 수 있습니다.";
			}else {
				msg = userId+"님에게 쪽지를 성공적으로 보냈습니다.";
			}
			
			//쪽지 쓰면 getmessage에도 insert되어야 함
			//1. userid로 userno 조회
			UsersVO userVo = userService.selectByUserId(userId);
			
			//2. getMessageVo 세팅
			GetMessageVO gVo =  new GetMessageVO();
			gVo.setUserNo(userVo.getUserNo());
			gVo.setMessageNo(vo.getMessageNo());
			
			//3. getMessage insert
			int count = getMessageService.insertGetMessage(gVo);
			logger.info("getMessage insert 결과 count={}", count);
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
		List<Map<String, Object>> list = messageService.selectSentMessage(userNo);
		logger.info("쪽지함 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		
		return "message/messageBoxSend";
	};
	
	//쪽지 상세보기
	@RequestMapping("/messageDetail.do")
	public String messageDetail_post(@RequestParam (defaultValue = "0") int messageNo,
			@RequestParam (defaultValue = "0") int getMessageNo,
			Model model) {
		logger.info("쪽지 상세보기 파라미터 messageNo={} getMessageNo={}", messageNo, getMessageNo);
		
		if(messageNo==0 && getMessageNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/message/messageBox.do");
			return "common/message";
		}
		
		Map<String, Object> map = null;
		if(messageNo!=0) {
			map = messageService.selectByMessageNo(messageNo);
		}else if(getMessageNo!=0) {
			map = messageService.selectByMessageNo(getMessageNo);
		}
		
		//보낸사람 ID 넘겨주기
		int sentUserNo = 0;
		if(map!=null && !map.isEmpty()) {
			sentUserNo = Integer.parseInt(String.valueOf(map.get("USER_NO")));
		}
		UsersVO userVo = userService.selectByUserNo(sentUserNo);
		String sentUserId = userVo.getUserId();
		
		model.addAttribute("map", map);
		model.addAttribute("sentUserId", sentUserId);
		
		return "message/messageDetail";
	};
	
	//개별쪽지 삭제하기
	@RequestMapping("/deleteMsg.do")
	public String delMsg(@RequestParam (defaultValue = "0") int messageNo,
			@RequestParam (defaultValue = "0") int getMessageNo,
			@RequestParam (required = false) String type,
			Model model) {
		logger.info("개별 쪽지 삭제하기 파라미터 messageNo={} getMessageNo={}", messageNo, getMessageNo);
		
		String msg="", url="/message/messageBox.do";

		int cnt=0;
		if(messageNo!=0 || getMessageNo!=0) {
			if(messageNo!=0) {
				//보낸 쪽지 삭제
				cnt = messageService.updateMsgDelflag(messageNo);
				
				Map<String, Object>  map = messageService.selectByMessageNo(messageNo);
				int important = Integer.parseInt(String.valueOf(map.get("GETMESSAGE_IMPFLAG")));
				logger.info("쪽지보관 여부 important={}", important);
				
				if(important==1) {
					//중요쪽지함 에서 삭제한 경우 중요 쪽지함으로 보내주기
					url="/message/messageBox.do?type=important";
				}else {
					url="/message/messageBoxSend.do";
				}
			}else if(getMessageNo!=0) {
				//받은 쪽지 삭제
				cnt = messageService.updategetMsgDelflag(getMessageNo);
				
				//나에게 쓴 쪽지함이라면
				if(type!=null && !type.isEmpty() && type.equals("toMe")) {
					url="/message/messageBox.do?type=toMe";
				}
			}
		}else {	//파라미터가 없는 경우
			msg="잘못된 url입니다.";
		}
		
		if(cnt>0) {
			msg="쪽지가 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//보관함에 저장 (받은 쪽지만)
	@RequestMapping("/updateImp.do")
	public String updateImp(@RequestParam (defaultValue = "0") int messageNo,
			@RequestParam (defaultValue = "0") int getMessageNo,
			Model model) {
		logger.info("보관함에 쪽지 저장 파라미터 messageNo={} getMessageNo={}", messageNo, getMessageNo);
		
		String msg="", url="";
		if(messageNo==0 && getMessageNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/message/messageBox.do");
			return "common/message";
		}
		
		int cnt=0;
	
		if(messageNo!=0 || getMessageNo!=0) {
			if(messageNo!=0) {
				//보낸 쪽지 보관함으로 
				cnt = messageService.updategetMsgImpflag(messageNo);
				url="/message/messageDetail.do?messageNo="+messageNo;
			}else if(getMessageNo!=0) {
				//받은 쪽지 보관함으로 
				cnt = messageService.updategetMsgImpflag(getMessageNo);
				url="/message/messageDetail.do?getMessageNo="+getMessageNo;
			}
		}else {	//파라미터가 없는 경우
			msg="잘못된 url입니다.";
		}
		
		if(cnt>0) {
			msg="보관함에 저장되었습니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam (defaultValue = "0") int messageNo,
			@RequestParam (defaultValue = "0") int getMessageNo,
			@RequestParam (required = false) String type,
			Model model) {
		
		logger.info("쪽지읽음 처리, messageNo={} getMessageNo={}", messageNo, getMessageNo);
		
		if(messageNo==0 && getMessageNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/message/messageBox.do");
			return "common/message";
		}
		
		String url="";
		int cnt=0;
		int userNo=1;	//세션값 넣기
		
		if(messageNo!=0 || getMessageNo!=0) {
			if(messageNo!=0) {
				cnt = getMessageService.updateReadCount(messageNo);
			}else if(getMessageNo!=0) {
				cnt = getMessageService.updateReadCount(getMessageNo);
			}
		}
		logger.info("읽음처리 결과, cnt={}", cnt);
		
		if(cnt>0) {	
			if(type!=null && !type.isEmpty()) {
				if(type.equals("important")) {	//보관함에 저장된 경우			
					UsersVO vo= userService.selectByUserNo(userNo);
					String userId = vo.getUserId();
					logger.info("userId={}",userId);
					
					if(userId.equals("kim")) {	//보낸편지 보관 
						url="/message/messageDetail.do?messageNo="+messageNo;
					}
					/*
						else {	//받은편지 보관
							url="/message/messageDetail.do?getMessageNo="+getMessageNo;
						}
					*/
				}else if(type.equals("toMe")) {	//나에게 보낸 편지함
					url = "/message/messageDetail.do?type=toMe&getMessageNo="+getMessageNo;
				}
			}else{
				if(messageNo!=0) {
					//보낸 쪽지함 
					url="/message/messageDetail.do?messageNo="+messageNo;
				}else {	//받은 쪽지함
					url="/message/messageDetail.do?getMessageNo="+getMessageNo;
				}
			}
		}
		
		return "redirect:"+url;
	}
	
	//답장
	@RequestMapping("/reply.do")
	public String reply(@RequestParam (defaultValue = "0") int getMessageNo, Model model) {
		logger.info("답장하기 파라미터 getMessageNo={}", getMessageNo);
		
		String msg="잘못된 url입니다.", url="/message/messageBox.do";
		if(getMessageNo==0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		//
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}
