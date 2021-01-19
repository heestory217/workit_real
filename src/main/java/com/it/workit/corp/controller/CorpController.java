package com.it.workit.corp.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.FileUploadUtil;
import com.it.workit.corp.model.CorpAllVO;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;
import com.it.workit.corp.model.CorpimgVO;

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
		logger.info("CorpVO={}",vo);
		
		String logoURL="";
		List<String> corpURLlist = new ArrayList<String>();
		try {
			List<Map<String, Object>> fileList = FileUtil.fileUplaod(request, FileUploadUtil.IMAGE_TYPE);
			Map<String, Object> firstMap = fileList.get(0);
			logoURL = (String)firstMap.get("fileName");
			logger.info("로고 logoURL={}",logoURL);
			logger.info("로고 fileList.size()={}",fileList.size());
			
			for(int i=0;i<fileList.size();i++) {
				Map<String,Object> corpMap=fileList.get(i);
				corpURLlist.add((String)corpMap.get("fileName"));
				logger.info("추가이미지 corpURLlist={}",corpURLlist.get(i));
			}
		} catch (IllegalStateException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		}
		vo.setCorpImgurl(logoURL);
		
		logger.info("추가이미지 corpURLlist.size={}",corpURLlist.size());
		
		List<CorpimgVO> imgList = new ArrayList<CorpimgVO>();
		for(int i=1; i<corpURLlist.size();i++) {
			logger.info("corpURLlist={}",corpURLlist.get(i));
			CorpimgVO imgVo = new CorpimgVO();
			imgVo.setCorpimgUrl(corpURLlist.get(i));
			imgList.add(imgVo);
			logger.info("imgvo={}",imgVo);
		}
		
		int cnt = corpService.insertCorp(vo, imgList);
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
		logger.info("기업명 검색 팝업 보여주기");
		return "company/corp/searchCorpname";
	}
	
	
	@RequestMapping("/corpDetail.do")
	public String corpDetail(@RequestParam(defaultValue = "0") int corpNo, Model model) {
		logger.info("기업 상세 정보 보기 corpNo={}",corpNo);
		if(corpNo==0) {
			String msg = "잘못된 URL입니다.";
			String url = "/index.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			return "common/message";
		}
		
		//CorpVO vo = corpService.selectCorp(corpNo);
		CorpAllVO vo = corpService.selectCorp(corpNo);
		logger.info("corpAllVO={}",vo);
		List<CorpimgVO> list = corpService.corpImgList(corpNo);
		logger.info("List<CorpimgVO> = {} ",list.size());
		
		model.addAttribute("imgList",list);
		model.addAttribute("cAllVo", vo);
		return "company/corp/corpDetail";
	}
}
