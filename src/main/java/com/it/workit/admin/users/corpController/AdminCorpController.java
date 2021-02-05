package com.it.workit.admin.users.corpController;

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
import com.it.workit.corp.model.CorpAllVo;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;
import com.it.workit.corp.model.CorpimgVO;

@Controller
@RequestMapping("/admin/users/corp")
public class AdminCorpController {
	private Logger logger = LoggerFactory.getLogger(AdminCorpController.class);
	
	@Autowired CorpService corpService;
	
	@RequestMapping("/corpList.do")
	public String adminCorpMain(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("corpList화면");
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(10);
		
		searchVo.setRecordCountPerPage(10);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//기업정보조회
		List<CorpVO> corpList = corpService.selectCorpList(searchVo);
		
		//등록 심사 기업 정보+이미지 조회
		List<CorpAllVo> corpWaitingList = corpService.selectCorpWaitingList();
		for(CorpAllVo vo : corpWaitingList) {
			int corpNo = vo.getCorpVo().getCorpNo();
			List<CorpimgVO> imgVo = corpService.selectCorpWaitingImgList(corpNo);
			vo.setCorpImgList(imgVo);
		}
		
		//페이징
		int totalRecord = corpService.selectCorpListCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("corpList", corpList);
		model.addAttribute("corpWaitingList", corpWaitingList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/users/corp/corpList";
	}
	
	@RequestMapping("/corpJudge.do")
	public String corpJudge(@RequestParam String corpNo, @RequestParam String type, Model model) {
		logger.info("기업 등록 반려 파람 corpNo={}, type={}", corpNo, type);
		String url="/admin/users/corp/corpList.do", msg="";
		
		if(type.equals("Y")) {
			int cnt = corpService.corpOkCheck(corpNo);
			if(cnt==1) {
				msg="기업 승인 완료";
			}else {
				msg="기업 승인 등록 실패";
			}
		}else if(type.equals("N")) {
			int cnt = corpService.corpReject(corpNo);
			if(cnt==1) {
				msg="기업 반려 완료";
			}else {
				msg="기업 반려 등록 실패";
			}
		}else if(type.equals("N")) {
			int cnt = corpService.corpReject(corpNo);
			if(cnt==1) {
				msg="기업 반려 완료";
			}else {
				msg="기업 반려 등록 실패";
			}
		}else if(type.equals("W")) {
			int cnt = corpService.corpWating(corpNo);
			if(cnt==1) {
				msg="기업 승인 대기 완료";
			}else {
				msg="승인 대기 실패";
			}
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);
		return "common/message";
	}
}
