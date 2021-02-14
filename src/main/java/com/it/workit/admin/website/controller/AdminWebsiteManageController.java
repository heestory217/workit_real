package com.it.workit.admin.website.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.admin.website.model.WebsiteManageService;
import com.it.workit.admin.website.model.WebsiteManageVO;

@Controller
@RequestMapping("/admin/siteManage")
public class AdminWebsiteManageController {
	private static final Logger logger = LoggerFactory.getLogger(AdminWebsiteManageController.class);
	@Autowired private WebsiteManageService websiteService;
	
	@RequestMapping("/termsOfService.do")
		public void termsOfService(Model model) {
		logger.info("이용약관 페이지 보여주기");
		Map<String, Object> map = websiteService.selectWebsiteManage("T");
		model.addAttribute("map", map);
	}
	
	@RequestMapping("/privacyPolicy.do")
	public void privacyPolicy(Model model) {
		logger.info("개인정보처리방침 페이지 보여주기");
		Map<String, Object> map = websiteService.selectWebsiteManage("P");
		model.addAttribute("map", map);
	}
	
	@RequestMapping(value="/websiteEdit.do", method = RequestMethod.GET)
	public String siteIntroEdit(@RequestParam String kind, @RequestParam String type, Model model) {
		if(type.equals("N")) { //신규등록
			if(kind.equals("T")) {
				logger.info("이용약관 등록 페이지 보여주기");
			}else if(kind.equals("P")) {
				logger.info("개인정보처리방침 등록 페이지 보여주기");
			}
		}else if(type.equals("E")) {	//수정
			Map<String, Object> map = null;
			if(kind.equals("T")) {
				logger.info("이용약관 수정 페이지 보여주기");
				map = websiteService.selectWebsiteManage("T");
			}else if(kind.equals("P")) {
				logger.info("개인정보처리방침 수정 페이지 보여주기");
				map = websiteService.selectWebsiteManage("P");
			}
			model.addAttribute("map", map);
		}
		return "admin/siteManage/websiteEdit";
	}
	
	@RequestMapping(value="/websiteEdit.do", method = RequestMethod.POST)
	public String siteIntroEdit_post(@ModelAttribute WebsiteManageVO vo, @RequestParam String type, Model model) {
		logger.info("웹사이트관리 종류 ={}", vo.getWebsitemanageTitle());
		
		String kind = vo.getWebsitemanageKind();
		String msg="", url="admin/siteManage/websiteEdit.do?kind="+kind+"&type="+type;
		
		if(kind.equals("T")) {
			vo.setWebsitemanageKind("T");
			vo.setWebsitemanageTitle("이용약관");
		}else if(kind.equals("P")) {
			vo.setWebsitemanageKind("P");
			vo.setWebsitemanageTitle("개인정보처리방침");
		}
		
		int cnt = 0;
		if(type.equals("N")) { //신규등록
			logger.info(vo.getWebsitemanageTitle()+"등록 처리 WebsiteManageVO={}", vo);

			cnt = websiteService.insertWebsiteManage(vo);
			logger.info(vo.getWebsitemanageTitle()+" 등록 결과 cnt={}", cnt);
			msg = vo.getWebsitemanageTitle()+" 등록 실패하였습니다";
			
			if(cnt>0) {
				msg="성공적으로 등록되었습니다";
			}

		}else if(type.equals("E")) {	//수정
			logger.info(vo.getWebsitemanageTitle()+"수정 처리 WebsiteManageVO={}", vo);
			
			cnt = websiteService.updateWebsiteManage(vo);
			logger.info(vo.getWebsitemanageTitle()+" 수정 결과 cnt={}", cnt);
			msg = vo.getWebsitemanageTitle()+" 수정 실패하였습니다";
			
			if(cnt>0) {
				msg="성공적으로 수정되었습니다";
			}

		}
		
		if(cnt>0) {
			if(kind.equals("T")) {
				url = "/admin/siteManage/termsOfService.do";
			}else if(kind.equals("P")) {
				url = "/admin/siteManage/privacyPolicy.do";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
			
}
