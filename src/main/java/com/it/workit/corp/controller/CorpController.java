package com.it.workit.corp.controller;

import java.io.BufferedReader;
import java.io.File;
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
		CorpVO vo = corpService.selectCorp(corpNo);
		logger.info("corpAllVO={}",vo);
		List<CorpimgVO> list = corpService.corpImgList(corpNo);
		logger.info("List<CorpimgVO> = {} ",list.size());
		
		model.addAttribute("imgList",list);
		model.addAttribute("cVo", vo);
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
		
		CorpVO vo = corpService.selectCorp(corpNo);
		List<CorpimgVO> imgList = corpService.corpImgList(corpNo);
		
		model.addAttribute("cVo", vo);
		model.addAttribute("imgList", imgList);
		logger.info("corpAllVO={}",vo);
		logger.info("imgList.size={}",imgList.size());
		
		return "company/corp/corpEdit";
	}
	
	@RequestMapping(value = "/corpEdit.do", method = RequestMethod.POST)
	public String corpEdit(@ModelAttribute CorpVO vo,
			@RequestParam String oldCorpImgurl, @RequestParam String oldAddimg1,
			@RequestParam String oldAddimg2, @RequestParam String oldAddimg3,
			@RequestParam String oldAddimg4, @RequestParam String corpImgurl, 
			HttpServletRequest request,
			Model model) {
		logger.info("기업정보 수정 파라미터 corpVo={}, 로고CorpImgurl={} ",vo,oldCorpImgurl);
		logger.info("기업정보 수정 파라미터 oldAddimg1={}, oldAddimg2={} ",oldAddimg1,oldAddimg2);
		logger.info("기업정보 수정 파라미터 oldAddimg3={}, oldAddimg4={} ",oldAddimg3,oldAddimg4);
		logger.info("로고 이미지 변경 정보 파라미터 corpImgurl={}",corpImgurl);
		
		List<CorpimgVO> imgList = new ArrayList<CorpimgVO>();
		String logoImg = corpImgurl;
		
		//로고이미지를 업로드 했을때
		if(!logoImg.equals("")) {
			//무조건 첫번째 파일은 로고임
			//나머지는 기업 서브 이미지 파일임
			//서브 이미지 파일들에 대한 처리
			String logoURL="";
			List<String> corpURLlist = new ArrayList<String>();
			
			try {
				List<Map<String, Object>> fileList = FileUtil.fileUplaod(request, FileUploadUtil.IMAGE_TYPE);
				Map<String, Object> firstMap = fileList.get(0);
				logoURL = (String)firstMap.get("fileName");
				logger.info("로고 logoURL={}",logoURL);
				logger.info("로고 fileList.size()={}",fileList.size());
				
				if(fileList.size()!=0) {
					for(int i=0;i<fileList.size();i++) {
						Map<String,Object> corpMap=fileList.get(i);
						corpURLlist.add((String)corpMap.get("fileName"));
						logger.info("추가이미지 corpURLlist={}",corpURLlist.get(i));
					}
				}
			} catch (IllegalStateException e) {
				logger.info("파일 업로드 실패");
				e.printStackTrace();
			} catch (IOException e) {
				logger.info("파일 업로드 실패");
				e.printStackTrace();
			}
			//로고이미지 등록완료
			vo.setCorpImgurl(logoURL);
			
			//기존 로고이미지 삭제 : oldCorpImgurl
			boolean bool = delFile(request, oldCorpImgurl);
			logger.info("로고 기존 파일 삭제 여부 : {}", bool);

			//서브 이미지 파일에 대한 처리
			logger.info("corpURLlist의 사이즈={}", corpURLlist.size());
			if(!corpURLlist.isEmpty() || corpURLlist.size()!=0 ) {
				for(int i=1; i<corpURLlist.size();i++) {
					logger.info("corpURLlist={}",corpURLlist.size());
						CorpimgVO imgVo = setVoImg(i, corpURLlist, vo);
						imgList.add(imgVo);
						bool = delFile(request, oldAddimg1);
						logger.info("수정 회사 이미지 imgvo={}",imgVo);
						logger.info("회사 이미지 기존파일 삭제여부 : {}", bool);
				}//for
			}
		}else{
			logger.info("esle처리");
			List<String> corpURLlist = new ArrayList<String>();
			try {
				List<Map<String, Object>> fileList = FileUtil.fileUplaod(request, FileUploadUtil.IMAGE_TYPE);
				if(fileList.size()!=0) {
					for(int i=0;i<fileList.size();i++) {
						Map<String,Object> corpMap=fileList.get(i);
						corpURLlist.add((String)corpMap.get("fileName"));
						logger.info("서브이미지 corpURLlist={}",corpURLlist.get(i));
					}
				}
			} catch (IllegalStateException e) {
				logger.info("파일 업로드 실패");
				e.printStackTrace();
			} catch (IOException e) {
				logger.info("파일 업로드 실패");
				e.printStackTrace();
			}
			
			logger.info("corpURLlist의 사이즈={}", corpURLlist.size());
			if(!corpURLlist.isEmpty() || corpURLlist.size()!=0 ) {
				for(int i=0; i<corpURLlist.size();i++) {
					logger.info("corpURLlist={}",corpURLlist.size());
					CorpimgVO imgVo = new CorpimgVO();
					imgVo.setCorpimgUrl(corpURLlist.get(i));
					imgVo.setCorpimgSortno((i+1));
					imgVo.setCorpNo(vo.getCorpNo());

					imgList.add(imgVo);
					boolean bool = delFile(request, oldAddimg1);
					logger.info("수정 회사 이미지 imgvo={}",imgVo);
					logger.info("회사 이미지 기존파일 삭제여부 : {}", bool);
				}//for
			}
		}
		
		//서비스 두개를 만듬 하나는 그냥 corp업데이트 다른하나는 이미지리스트 업데이트
		//이미지 리스트 업데이트할때는 기업번호와 sortno를 where조건으로 사용함
		int cnt = corpService.editCorp(vo);
		
		for(int i=0; i<imgList.size(); i++) {
			logger.info("imgList vo {}",imgList.get(i));
			}
		
		int imgCnt = corpService.editCorpImg(imgList);
		
		logger.info("수정 성공 여부 결과 cnt={}",cnt);
		logger.info("이미지파일 수정 성공 여부 결과 cnt={}",imgCnt);
		String msg="수정 성공", url="/index.do";
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	//파일 삭제 메서드
	private boolean delFile(HttpServletRequest request, String fileName) {
		String upPath = FileUtil.getUploadPath(FileUploadUtil.IMAGE_TYPE, request);
		File oldFile = new File(upPath, fileName);
		boolean bool = false;
		if(oldFile.exists()) {
			bool = oldFile.delete();
		}
		return bool;
	}
	
	//이미지 파일 vo셋팅 메서드
	private CorpimgVO setVoImg(int i, List<String> corpURLlist, CorpVO vo) {
		CorpimgVO imgVo = new CorpimgVO();
		imgVo.setCorpimgUrl(corpURLlist.get(i));
		imgVo.setCorpimgSortno(i);
		imgVo.setCorpNo(vo.getCorpNo());
		return imgVo;
	}

}
