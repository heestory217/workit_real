package com.it.workit.corp.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.workit.common.FileUploadUtil;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;

@Controller
@RequestMapping("/company/corp")
public class CorpController {
	private static final Logger logger
	=LoggerFactory.getLogger(CorpController.class);
	
	@Autowired CorpService corpService;
	@Autowired FileUploadUtil FileUtil;
	
	@RequestMapping(value="/corpWrite.do", method=RequestMethod.GET )
	public String corpRegister() {
		logger.info("기업 등록 화면 보여주기");
		return "company/corp/corpWrite";
	}
	
	@RequestMapping(value="/corpWrite.do", method=RequestMethod.POST)
	public String corpRegisterPost(@ModelAttribute CorpVO vo, HttpServletRequest request, Model model) {
		logger.info("corpVO={}",vo);
		
		String imgURL="";
		try {
			List<Map<String, Object>> fileList = FileUtil.fileUplaod(request, FileUploadUtil.PDS_TYPE);
			for(Map<String, Object> fileMap : fileList) {
				imgURL = (String)fileMap.get("fileName");
			}
		} catch (IllegalStateException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		}
		
		vo.setCorpImgurl(imgURL);
		
		int cnt = corpService.insertCorp(vo);
		logger.info("기업정보 등록 성공 여부 cnt={}",cnt);
		
		String msg="기업 등록 실패", url="/index.do";
		if(cnt>0) {
			msg="기업 등록 성공, 기업 승인까지 최대 3일이 소요 됩니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/searchCorpname.do")
	public String searchCorp() {
		logger.info("기업명 검색 화면 보여주기");
		return "company/corp/searchCorpname";
	}
}
