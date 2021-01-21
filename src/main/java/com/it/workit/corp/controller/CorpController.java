package com.it.workit.corp.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.it.workit.common.FileUploadUtil;
import com.it.workit.corp.model.CorpAllVO;
import com.it.workit.corp.model.CorpRecruitViewVO;
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
			imgVo.setCorpimgSortno(i);
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
	
	@RequestMapping("/corpRecruitList.do")
	public String corpRecuritList(@RequestParam(defaultValue = "0") int userNo, Model model) {
		logger.info("기업별 채용공고 보기 해당 기업의 userNo={}",userNo);
		if(userNo==0) {
			String msg="잘못된 URL입니다.",url="/index.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		List<CorpRecruitViewVO> crVoList = corpService.selectRecruit(userNo);
		logger.info("기업별 채용공고 리스트 사이즈 ={}",crVoList.size());
		for(CorpRecruitViewVO vo:crVoList) {
			System.out.println("채용공고 vo : "+vo);
		}
		model.addAttribute("crVoList", crVoList);
		return "company/corp/corpRecruitList";
	}
	
	@RequestMapping("/corpSearch.do")
	public void corpSearch(HttpServletRequest req, ModelMap model, HttpServletResponse response) throws Exception{
		
		String currentPage = req.getParameter("currentPage");
		String countPerPage = "10";
		String keyword = req.getParameter("searchCorpName");    //검색어 키워드
		/*
		String currentPage = req.getParameter("currentPage");    //요청 변수 설정 (현재 페이지. currentPage : n > 0)
		String countPerPage = req.getParameter("countPerPage");  //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
		String keyword = req.getParameter("searchCorpName");    //검색어 키워드
		*/
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1160100/service/GetCorpBasicInfoService/getCorpOutline");
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=mM0Se4DVXfKI%2BsK9%2Fo1OfzvmqlZqJLLseDsuYnPxAenpxC%2Fpb8bPhPHV43WFTcr4%2FTYe%2FQKs9SM57KcsTsV%2BrQ%3D%3D");
		urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode(countPerPage,"UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(currentPage,"UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("resultType","UTF-8") + "=" + URLEncoder.encode("xml","UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("corpNm","UTF-8") + "=" + URLEncoder.encode(keyword,"UTF-8"));
		logger.info("urlBuilder.toString={}",urlBuilder.toString());
		
		URL url = new URL(urlBuilder.toString());
		BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
    	StringBuffer sb = new StringBuffer();
    	String tempStr = null;

    	while(true){
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);		// 응답결과 XML 저장
    	}
    	br.close();
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());	
	}
	
	@RequestMapping(value = "/corpEdit.do", method = RequestMethod.GET)
	public String corpEdit(@RequestParam(defaultValue = "0") int corpNo, Model model) {
		logger.info("기업정보 수정 페이지 cropNo={}",corpNo);
		
		if(corpNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/reBoard/list.do");
			return "common/message";
		}
		
		CorpAllVO vo = corpService.selectCorp(corpNo);
		List<CorpimgVO> imgList = corpService.corpImgList(corpNo);
		
		model.addAttribute("cAllVo", vo);
		model.addAttribute("imgList", imgList);
		logger.info("corpAllVO={}",vo);
		logger.info("imgList.size={}",imgList.size());
		
		return "company/corp/corpEdit";
		
	}
	

}
