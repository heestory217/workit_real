package com.it.workit.admin.resumeManager.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.collections4.map.HashedMap;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.it.workit.admin.resumeManager.model.ResumeMngService;
import com.it.workit.common.FileUploadUtil;
import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.common.Utility;
import com.it.workit.resumes.model.AwardVO;
import com.it.workit.resumes.model.CarrerVO;
import com.it.workit.resumes.model.ForeignlanguageskillVO;
import com.it.workit.resumes.model.LicencseVO;
import com.it.workit.resumes.model.ResumesService;

@Controller
@RequestMapping("/admin/users/resume")
public class resumeManagerController {
	private static final Logger logger
	=LoggerFactory.getLogger(resumeManagerController.class);

	@Autowired private ResumesService rsService;
	@Autowired private ResumeMngService rsMngService;
	@Autowired private FileUploadUtil fileUtil;

	@RequestMapping("/resumeManager.do")
	public void resumeManager(@ModelAttribute SearchVO searchVo ,Model model) {
		logger.info("이력서관리자 화면처리");

		//2
		//[페이징 처리] 
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);

		//[2] SearchVo 셋팅
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord = rsMngService.rsOpenTotal(searchVo);
		logger.info("총 글 개수 tatal={}",totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<Map<String, Object>> rsList = rsMngService.resumeByOpenNo(searchVo);
		logger.info("글목록 조회 결과 rsList.size={}",rsList.size());


		//3
		model.addAttribute("rsList",rsList);
		model.addAttribute("pagingInfo",pagingInfo);

	}

	//디테일 페이지
	@RequestMapping("/resumeCheck.do")
	public void resumeDetail(@RequestParam(defaultValue = "0") int resumeNo,
			Model model) {
		logger.info("디테일페이지 보여주기");

		Map<String, Object> map=rsService.selectByRsUser(resumeNo);
		List<AwardVO> aList=rsService.selectAwdByNo(resumeNo);
		List<CarrerVO> cList = rsService.selectCarByNo(resumeNo);
		List<ForeignlanguageskillVO> fList=rsService.selectFlsByNo(resumeNo);
		List<LicencseVO> lcList=rsService.selectLicenByNo(resumeNo);

		model.addAttribute("map",map);
		model.addAttribute("aList",aList);
		model.addAttribute("cList",cList);
		model.addAttribute("fList",fList);
		model.addAttribute("lcList",lcList);

	}
	
	//승인
	@RequestMapping("/resumreAck.do")
	public String resumreAck(@RequestParam(defaultValue = "0") int resumeNo,
			Model model) {
		//1
		logger.info("이력서 승인 resumeNo={}",resumeNo);
		
		//2
		int cnt = rsMngService.resumreAck(resumeNo);
		logger.info("이력서 승인 cnt={}",cnt);
		
		String msg="승인 실패 했습니다", url="/admin/users/resume/resumeCheck.do?resumeNo="+resumeNo;
		if (cnt>0) {
			msg="승인 했습니다";
			url="/admin/users/resume/resumeManager.do";
		}
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		//4
		return "common/message";
	}
	
	//반려
	@RequestMapping("/resumreBack.do")
	public String resumreBack(@RequestParam(defaultValue = "0") int resumeNo,
			Model model) {
		//1
		logger.info("이력서 반려 resumeNo={}",resumeNo);
		//2
		int cnt = rsMngService.resumreBack(resumeNo);
		String msg="반려 실패 했습니다", url="/admin/users/resume/resumeCheck.do?resumeNo="+resumeNo;
		if (cnt>0) {
			msg="반려 했습니다";
			url="/admin/users/resume/resumeManager.do";
		}
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		//4
		return "common/message";
	}

	//파일 다운로드
	@RequestMapping("/download.do")
	public ModelAndView download(@RequestParam(defaultValue = "0") int resumeNo,
			@RequestParam String resumeFilename,
			HttpServletRequest request) {
		//1
		logger.info("다운로드 처리 파라미터 resumeNo={}, resumeFilename={}",resumeNo,resumeFilename);
		//2
		//3
		Map<String, Object> map = new HashedMap<String, Object>();
		String upPath = fileUtil.getUploadPath(FileUploadUtil.PDS_TYPE, request);
		File file = new File(upPath,resumeFilename); 

		map.put("file", file); 

		ModelAndView mav = new ModelAndView("resumeDownloadView", map);

		//4
		return mav;
	}
}










