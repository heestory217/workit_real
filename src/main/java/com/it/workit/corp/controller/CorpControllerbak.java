package com.it.workit.corp.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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


public class CorpControllerbak {
	private static final Logger logger
	=LoggerFactory.getLogger(CorpControllerbak.class);
	
	@Autowired CorpService corpService;
	@Autowired FileUploadUtil FileUtil;
	
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
	
	@RequestMapping(value = "/corpEdit.do", method = RequestMethod.POST)
	public String corpEdit(@ModelAttribute CorpVO vo,
			@RequestParam String oldCorpImgurl, @RequestParam String oldAddimg1,
			@RequestParam String oldAddimg2, @RequestParam String oldAddimg3,
			@RequestParam String oldAddimg4,
			@RequestParam String corpImgurl, @RequestParam String img1,
			@RequestParam String img2,@RequestParam String img3,
			@RequestParam String img4,
			HttpServletRequest request,
			Model model) {
		logger.info("기업정보 수정 파라미터 corpVo={}, 로고CorpImgurl={} ",vo,oldCorpImgurl);
		logger.info("기업정보 수정 파라미터 oldAddimg1={}, oldAddimg2={} ",oldAddimg1,oldAddimg2);
		logger.info("기업정보 수정 파라미터 oldAddimg3={}, oldAddimg4={} ",oldAddimg3,oldAddimg4);
		logger.info("로고 이미지 변경 정보 파라미터 corpImgurl={}",corpImgurl);
		logger.info("메인 이미지 변경 정보 파라미터 {}",img1);
		logger.info("서브이미지1 변경 정보 파라미터 {}",img2);
		logger.info("서브이미지2 변경 정보 파라미터 {}",img3);
		logger.info("서브이미지3 변경 정보 파라미터 {}",img4);
		
		List<CorpimgVO> imgList = new ArrayList<CorpimgVO>();
		
		//로고이미지를 업로드 했을때
		if(corpImgurl!=null) {
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
			//로고이미지 등록완료
			vo.setCorpImgurl(logoURL);
			
			//기존 로고이미지 삭제 : oldCorpImgurl
			boolean bool = delFile(request, oldCorpImgurl);
			logger.info("로고 기존 파일 삭제 여부 : {}", bool);

			//서브 이미지 파일에 대한 처리
			for(int i=1; i<corpURLlist.size();i++) {
				logger.info("corpURLlist={}",corpURLlist.size());
				if(img1!=null) {
					CorpimgVO imgVo = setVoImg(i, corpURLlist, vo);
					imgList.add(imgVo);
					bool = delFile(request, oldAddimg1);
					logger.info("1번 이미지 imgvo={}",imgVo);
					logger.info("1번 이미지 기존파일 삭제여부 : {}", bool);
				}
				if(img2!=null) {
					CorpimgVO imgVo = setVoImg(i, corpURLlist, vo);
					imgList.add(imgVo);
					bool = delFile(request, oldAddimg2);
					logger.info("2번 이미지 imgvo={}",imgVo);
					logger.info("2번 이미지 기존파일 삭제여부 : {}", bool);
				}
				if(img3!=null) {
					CorpimgVO imgVo = setVoImg(i, corpURLlist, vo);
					imgList.add(imgVo);
					bool = delFile(request, oldAddimg3);
					logger.info("3번 이미지 imgvo={}",imgVo);
					logger.info("3번 이미지 기존파일 삭제여부 : {}", bool);
				}
				if(img4!=null) {
					CorpimgVO imgVo = setVoImg(i, corpURLlist, vo);
					imgList.add(imgVo);
					bool = delFile(request, oldAddimg4);
					logger.info("4번 이미지 imgvo={}",imgVo);
					logger.info("4번 이미지 기존파일 삭제여부 : {}", bool);
				}
			}
		}
		/*else {
			
			//로고 이미지를 새로 업로드하지 않았을때
			//들어온 이미지 사이즈만큼 for로 반복
			// if img1!=null일때 값세팅 새로운 vo를 만들어서 이미지 주소랑 회사번호랑 sortno셋팅 imgVolist에 add
			// if img2!=null일때 새로운 vo를 만들어서 이미지 주소랑 sortno셋팅
		}
		*/
		//서비스 두개를 만듬 하나는 그냥 corp업데이트 다른하나는 이미지리스트 업데이트
		//이미지 리스트 업데이트할때는 기업번호와 sortno를 where조건으로 사용함
		
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
