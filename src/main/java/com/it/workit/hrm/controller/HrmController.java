package com.it.workit.hrm.controller;

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

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.Utility;
import com.it.workit.getmessage.model.GetMessageVO;
import com.it.workit.hrm.model.HrmResumePageVO;
import com.it.workit.message.model.MessageListVO;
import com.it.workit.message.model.MessageVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.review.model.ReviewVO;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/company/HRManagment")
public class HrmController {
	
	private static final Logger logger = LoggerFactory.getLogger(HrmController.class);
	@Autowired private OrdersService ordersService;
	//@Autowired private ResumesService resumesService;
	
	@RequestMapping("/purchasedResumes.do")
	public String purchasedResumes(@ModelAttribute HrmResumePageVO searchVo, 
			@RequestParam (required = false) String searchPRKeyword,
			HttpSession session, Model model) {
		logger.info("구매 이력서 페이지");
		
		searchVo.setSearchKeyword(searchPRKeyword);
		logger.info("검색 키워드 : searchKeyword={}", searchPRKeyword);
		
		//키워드 조절
		if(searchPRKeyword!=null && !searchPRKeyword.isEmpty()) {
			if(searchPRKeyword.equals("신입")) {
				searchVo.setSearchKeyword("0");
			}else if(searchPRKeyword.lastIndexOf("년")>0) {
				int idx = searchPRKeyword.lastIndexOf("년");
				searchVo.setSearchKeyword(searchPRKeyword.substring(0, idx));
			}
		}

		int userNo = (Integer) session.getAttribute("userNo");
		searchVo.setUserNo(userNo);
		
		//페이징
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		//구매한 이력서 리스트 
		List<Map<String, Object>> resumeList = ordersService.selectPurchasedResume(searchVo);
		logger.info("구매 이력서 list.size={}", resumeList.size());
		
		int totalRecord=ordersService.selectTotalResumeRecord(searchVo);
		logger.info("전체 구매 이력서 수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("resumeList", resumeList);
		
		return "company/HRManagment/purchasedResumes";
	}
	
	@RequestMapping("/positionSuggest.do")
	public String positionSuggest() {
		
		return "company/HRManagment/position/positionSuggest";
	}
	
	@RequestMapping(value="/positionWrite.do", method = RequestMethod.GET)
	public String positionWrite(HttpSession session, Model model) {
		logger.info("포지션제안 쓰기 페이지 보여주기");
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("userId", userId);

		return "company/HRManagment/position/positionWrite";
	}

	/*
	@RequestMapping(value="/messageWrite.do", method = RequestMethod.POST)
	public String messageWrite_post(HttpSession session, @ModelAttribute MessageVO vo,
			@RequestParam (defaultValue = "0") int getMessageNo,
			@RequestParam (required = false) String userId, 
			Model model) {

		logger.info("쪽지 쓰기 처리, 파라미터 vo={}", vo);
		logger.info("쪽지 쓰기 처리, 파라미터 userId={}", userId);
		logger.info("쪽지 답장쓰기 처리, 파라미터 getMessageNo={}", getMessageNo);
		
		String sentUserID="";
		if(getMessageNo!=0) {
			Map<String, Object> map = messageService.selectByMessageNo(getMessageNo);
			int sentUserNo = Integer.parseInt(String.valueOf(map.get("USER_NO")));
			UsersVO uVo = userService.selectByUserNo(sentUserNo);
			sentUserID = uVo.getUserId();
			logger.info("보낸회원 sentUserID={}", sentUserID);
		}

		String myId = (String) session.getAttribute("userId");
		logger.info("세션 로그인 아이디 조회, myId={}", myId);

		int cnt = messageService.insertMessage(vo);
		String msg="쪽지 전송 실패", url="/message/messageWrite.do";
		if(cnt>0) {
			if(userId==null || userId.isEmpty()) {
				if(sentUserID!=null && !sentUserID.isEmpty()) {
					userId=sentUserID;
					msg = userId+"님에게 답장을 성공적으로 보냈습니다.";
				}else {
					userId=myId;	//유저아이디가 없는 경우 => 나에게 보내는 쪽지
					msg = "쪽지를 성공적으로 보냈습니다.\\n\\n나에게 쓴 쪽지는 [나에게 쓴 쪽지함]에서 확인할 수 있습니다.";
				}
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
	}

	@RequestMapping("/messageBoxSend.do")
	public String messageBoxSend(HttpSession session, ModelMap model) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("보낸 쪽지함 조회, userNo={}", userNo);

		List<Map<String, Object>> list = messageService.selectSentMessage(userNo);
		logger.info("쪽지함 조회 결과 list.size={}", list.size());

		model.addAttribute("list", list);

		return "message/messageBoxSend";
	}

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
				url="/message/messageBoxSend.do";
			}else if(getMessageNo!=0) {
				//받은 쪽지 삭제
				cnt = messageService.updategetMsgDelflag(getMessageNo);

				Map<String, Object>  map = messageService.selectByMessageNo(getMessageNo);
				int important = Integer.parseInt(String.valueOf(map.get("GETMESSAGE_IMPFLAG")));
				logger.info("쪽지보관 여부 important={}", important);

				if(important==1) {
					url="/message/messageBox.do?type=important";
				}else if(type!=null && !type.isEmpty() && type.equals("toMe")) {
					url="/message/messageBox.do?type=toMe";
				}else{
					url="/message/messageBox.do";
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
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(HttpSession session, @RequestParam (defaultValue = "0") int getMessageNo,
			@RequestParam (required = false) String type, Model model) {

		logger.info("쪽지읽음 처리 getMessageNo={}", getMessageNo);

		if(getMessageNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/message/messageBox.do");
			return "common/message";
		}

		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("userNo={}", userNo);

		int cnt= getMessageService.updateReadCount(getMessageNo);
		logger.info("받은쪽지 읽음처리 결과, cnt={}", cnt);

		return "redirect:/message/messageDetail.do?getMessageNo="+getMessageNo;
	}
	
	@RequestMapping("/deleteMultiMsg.do")
	public String deleteMultiMsg(@ModelAttribute MessageListVO msgListVo,
			Model model) {
		logger.info("선택한 쪽지 삭제(플래그 갱신) 처리, 파라미터 msgListVo={}", msgListVo);
		
		List<MessageVO> msgList = msgListVo.getMsgItems(); 
		int cnt = messageService.updateMsgDelflagMulti(msgList);
		logger.info("선택한 쪽지 삭제 결과, cnt={}", cnt);

		String msg="선택한 쪽지 삭제 실패!", url="/message/messageBoxSend.do";
		
		if(cnt>0) {
			msg="선택한 쪽지를 삭제하였습니다.";
			for(int i=0;i<msgList.size();i++) {
				MessageVO msgVo = msgList.get(i);
				logger.info("[{}] : messageNo={}", i, msgVo.getMessageNo());
			}//for
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
	*/
}
