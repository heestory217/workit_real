package com.it.workit.users.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.admin.notice.model.NoticeService;

@Controller
@RequestMapping("/notice")
public class UsersNoticeController {
	private static final Logger logger
		= LoggerFactory.getLogger(UsersNoticeController.class);
	@Autowired private NoticeService noticeSerivce;
	
	@RequestMapping("/noticeList.do")
	public void list() {
		logger.info("회원 사이트 공지사항 화면");
	}
}
