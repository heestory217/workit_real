package com.it.workit.users.notice.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.admin.notice.model.ClassificationsVO;
import com.it.workit.admin.notice.model.NoticeSearchVO;
import com.it.workit.admin.notice.model.NoticeService;
import com.it.workit.admin.notice.model.NoticeVO;
import com.it.workit.common.PaginationInfo;

@Controller
@RequestMapping("/notice")
public class UsersNoticeController {
	private static final Logger logger
		= LoggerFactory.getLogger(UsersNoticeController.class);
	@Autowired private NoticeService noticeService;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute NoticeSearchVO searchVo ,
			@RequestParam(defaultValue = "0") int type, Model model) {
		logger.info("관리자 - 공지사항 목록 조회");

		List<ClassificationsVO> cateList = noticeService.selectClassifications();
		logger.info("관리자 - 공지사항 카테고리 조회 결과, cateList.size={}", cateList.size());
		
		int all=0,notice=0,event=0,guide=0;
		if(type==0) {
			searchVo.setClassificationNo(0);
			all=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수, all={}", all);
		}else if(type==1) {
			searchVo.setClassificationNo(1);
			notice=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수 - 공지, notice={}", notice);
		}else if(type==2) {
			searchVo.setClassificationNo(2);
			event=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수 - 이벤트, notice={}", notice);
		}else if(type==3) {
			searchVo.setClassificationNo(3);
			guide=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수 - 안내, notice={}", notice);
		}
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord=0;
		List<Map<String, Object>> noticeList = null;
		if(type==0) {
			searchVo.setClassificationNo(0);
			noticeList = noticeService.selectAllNotice(searchVo);
			logger.info("공지사항 전체 조회 결과, noticeList.size={}", noticeList.size());
			totalRecord=all;
		}else if(type==1) {
			searchVo.setClassificationNo(1);
			noticeList = noticeService.selectAllNotice(searchVo);
			logger.info("공지사항 조회 결과-공지, noticeList.size={}", noticeList.size());
			totalRecord=notice;
		}else if(type==2) {
			searchVo.setClassificationNo(2);
			noticeList = noticeService.selectAllNotice(searchVo);
			logger.info("공지사항 조회 결과-이벤트, noticeList.size={}", noticeList.size());
			totalRecord=event;
		}else if(type==3) {
			searchVo.setClassificationNo(3);
			noticeList = noticeService.selectAllNotice(searchVo);
			logger.info("공지사항 조회 결과-안내, noticeList.size={}", noticeList.size());
			totalRecord=guide;
		}
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("cateList", cateList);
		
		return "notice/noticeList";
	}
	
	
	//공지사항 게시글 조회수 업데이트 
	@RequestMapping("/noticeViewCnt.do")
	public String viewCount(@RequestParam(defaultValue = "0") int rnum) {
		logger.info("공지사항 조회수 업데이트, 파라미터 rnum={}", rnum);
		Map<String, Object> map = noticeService.selectNoticeOne(rnum);
		
		int noticeNo = Integer.parseInt(String.valueOf(map.get("NOTICE_NO")));
		int cnt=noticeService.viewUpdate(noticeNo);
		logger.info("조회수 업데이트 결과, cnt={}", cnt);
		
		return "redirect:/notice/noticeDetail.do?rnum="+rnum;
	}
	
	
	@RequestMapping("/noticeDetail.do")
	public String noticeDetail(@RequestParam(defaultValue = "0") int rnum,Model model) {
		logger.info("공지사항 상세페이지 조회, 파라미터 noticeNo={}", rnum);
		
		Map<String, Object> noticeOne = noticeService.selectNoticeOne(rnum);
		logger.info("회원 사이트 - 공지사항 상세페이지 조회 결과, noticeOne={}", noticeOne);
		
		int prevNo=rnum+1;
		Map<String, Object> prevNotice = noticeService.selectNoticeOne(prevNo);
		logger.info("공지사항 이전 글, noticeOne={}", noticeOne);
		
		
		int nextNo=rnum-1;
		Map<String, Object> nextNotice = noticeService.selectNoticeOne(nextNo);
		logger.info("공지사항 다음 글, noticeOne={}", noticeOne);
		
		int totalR = noticeService.getRecordCount();
		
		
		model.addAttribute("noticeOne", noticeOne);
		model.addAttribute("prevNotice", prevNotice);
		model.addAttribute("nextNotice", nextNotice);
		model.addAttribute("totalR", totalR);
		
		return "notice/noticeDetail";
	}
	
		
}

