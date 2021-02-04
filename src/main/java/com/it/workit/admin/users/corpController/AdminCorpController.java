package com.it.workit.admin.users.corpController;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;

@Controller
@RequestMapping("/admin/users/corp")
public class AdminCorpController {
	private Logger logger = LoggerFactory.getLogger(AdminCorpController.class);
	
	@Autowired CorpService corpService;
	
	@RequestMapping("/corpList.do")
	public String adminMain(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("corpList화면");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(10);
		
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<CorpVO> corpList = corpService.selectCorpList(searchVo);
		
		int totalRecord = corpService.selectCorpListCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("corpList", corpList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/users/corp/corpList";
	}
}
