package com.it.workit.admin.notice.controller;

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
import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {
	private static final Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo ,Model model) {
		logger.info("관리자 - 공지사항 목록 조회");
		List<ClassificationsVO> cateList = noticeService.selectClassifications();
		logger.info("관리자 - 공지사항 카테고리 조회 결과, cateList.size={}", cateList.size());
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord=noticeService.getTotalRecord(searchVo);
		logger.info("공지사항 총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<Map<String, Object>> noticeList = noticeService.selectNoticeAll(searchVo);
		logger.info("공지사항 전체 조회 결과, noticeList.size={}", noticeList.size());
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("cateList", cateList);
		
		return "admin/notice/noticeList";
		
	}
}
