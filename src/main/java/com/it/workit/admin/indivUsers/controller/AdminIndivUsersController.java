package com.it.workit.admin.indivUsers.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.common.Utility;
import com.it.workit.users.model.UsersDAO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/admin/users/indiv")
public class AdminIndivUsersController {
	private Logger logger
		=LoggerFactory.getLogger(AdminIndivUsersController.class);
	
	@Autowired private UsersService usersService;
	
	@RequestMapping("/selectIndivUsers.do")
	public String selectIndivUsers(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("관리자 - 개인 회원 조회 View / 파라미터 searchVo={}",searchVo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord=usersService.totalUsers(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		List<UsersVO> list=usersService.selectIndivUsersAll(searchVo);
		
		logger.info("list.size={}",list.size());
		model.addAttribute("list", list);
		
		return "admin/users/indiv/selectIndivUsers";
	}
	
	@RequestMapping("/selectWithdrawUsers.do")
	public String selectWithdrawUsers(Model model, @ModelAttribute SearchVO searchVo) {
		logger.info("관리자 - 개인 탈퇴 회원 조회 View / 파라미터 searchVo={}",searchVo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
				
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
				
		int totalRecord=usersService.totalWithdrawUsers(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
				
		List<UsersVO> list=usersService.selectWithdrawUsersAll(searchVo);
				
		logger.info("list.size={}",list.size());
		model.addAttribute("list", list);
				
		return "admin/users/indiv/selectWithdrawUsers";
	}
	
	@RequestMapping("/withdrawUsers.do")
	public String withdrawUsers(@RequestParam(defaultValue ="0") int userNo, Model model) {
		logger.info("탈퇴 userNo={}",userNo);
		
		if(userNo==0) {
			String msg="잘못된 접근입니다. 다시 시도하세요", url="/admin/users/indiv/selectIndivUsers.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
		int cnt=usersService.withdrawUsers(userNo);
		
		String msg="잘못된 접근입니다. 다시 시도하세요", url="/admin/users/indiv/selectIndivUsers.do";
		
		if(cnt>0) {
			msg="탈퇴 처리 되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
		
	}
}
