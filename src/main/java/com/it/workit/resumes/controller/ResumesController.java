package com.it.workit.resumes.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.resumes.model.AwardVO;
import com.it.workit.resumes.model.CarrerVO;
import com.it.workit.resumes.model.ForeignlanguageskillVO;
import com.it.workit.resumes.model.LicencseVO;
import com.it.workit.resumes.model.ResumeListVO;
import com.it.workit.resumes.model.ResumesService;
import com.it.workit.resumes.model.ResumesVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/resumes")
public class ResumesController {

	private static final Logger logger
	=LoggerFactory.getLogger(ResumesController.class);

	@Autowired private ResumesService rsService;
	@Autowired private UsersService userService;

	@RequestMapping(value = "/resumesList.do", method = RequestMethod.GET)
	public String resumeList(HttpSession session, Model model) {
		logger.info("리스트 화면 처리");
		
		String userId = (String) session.getAttribute("userId");
		logger.info("userId={}",userId);
		
		if (userId==null||userId.isEmpty()) {
			String mag = "로그인 후 사용가능합니다";
			String url = "/index.do";
			
			model.addAttribute("msg",mag);
			model.addAttribute("url",url);
			return "common/message";
		}
		
		UsersVO userVo = userService.selectByUserId(userId);
		int userNo=userVo.getUserNo();
		logger.info("userNo={}",userNo);
		
		//2
		List<ResumesVO> resumeList =rsService.selectResumeByNo(userNo);
		logger.info("resumeList={}",resumeList);
		//3
		model.addAttribute("resumeList", resumeList);
		//4
		return "resumes/resumesList";
	}

	@RequestMapping(value ="/resumeWrite.do", method = RequestMethod.GET)
	public void resumeWrite_get(HttpSession session, Model model) {
		logger.info("이력서 쓰기 화면");
		
		String userId = (String) session.getAttribute("userId");
		
		UsersVO userVo = userService.selectByUserId(userId);
		
		model.addAttribute("userVo",userVo);
	}


	@RequestMapping(value ="/resumeWrite.do", method = RequestMethod.POST)
	public String resumeWrite_post(@ModelAttribute ResumesVO resumeVo,
			@ModelAttribute ResumeListVO relistVo,HttpSession session,Model model) {
		logger.info("한방에 들어오니? relistVo={}", relistVo);
		logger.info("이력서 resumeVo={}", resumeVo);

		int resumResult = rsService.insertResume(resumeVo);
		logger.info("이력서 resumResult={}",resumResult);
		int resumeNo = resumeVo.getResumeNo();	// 등록된 이력서에서 번호 추출
		logger.info("resumNo={}",resumeNo);

		//이력서 리스트 브이오의 각 멤버변수에 이력서번호 세팅
		//relistVo.setResumeNo(resumNo);

		List<AwardVO> awlist = relistVo.getAwardVOList();
		for(AwardVO vo : awlist) {
			vo.setResumeNo(resumeNo);
		}

		List<CarrerVO> carrlist = relistVo.getCarrerVOList();
		for (CarrerVO vo : carrlist) {
			vo.setResumeNo(resumeNo);
		}

		List<ForeignlanguageskillVO> flslist = relistVo.getForeignskillVO();
		for (ForeignlanguageskillVO vo : flslist) {
			vo.setResumeNo(resumeNo);
		}

		List<LicencseVO> licelist = relistVo.getLicenVOList();
		for (LicencseVO vo : licelist) {
			vo.setResumeNo(resumeNo);
		}

		relistVo.setAwardVOList(awlist);

		logger.info("awlist={}",awlist);
		logger.info("carrlist={}",carrlist);
		logger.info("flslist={}",flslist);
		logger.info("licelist={}",licelist);


		String msg="등록 실패하였습니다", url="/resumes/resumeWrite.do";
		if (resumResult>0) {
			int cnt = rsService.insertResumesMulti(relistVo);
			logger.info("등록결과 cnt={}", cnt);

			if (cnt>0) {
				msg="등록 성공하였습니다";
				url="/resumes/resumesList.do";
				for (int i = 0; i < awlist.size(); i++) {
					AwardVO aVo = awlist.get(i);
					logger.info("aVo={}",aVo);
				}
				for (int i = 0; i < carrlist.size(); i++) {
					CarrerVO cVo = carrlist.get(i);
					logger.info("cVo={}",cVo);
				}
				for (int i = 0; i < flslist.size(); i++) {
					ForeignlanguageskillVO fVo = flslist.get(i);
					logger.info("fVo={}",fVo);
				}
				for (int i = 0; i < licelist.size(); i++) {
					LicencseVO lVo = licelist.get(i);
					logger.info("lVo={}",lVo);
				}
			}
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}//이력서 등록

	
	//디테일 페이지
	@RequestMapping("/resumeDetail.do")
	public void resumeDetail(@RequestParam(defaultValue = "0") int resumeNo,
			HttpSession session, Model model) {
		logger.info("디테일페이지 보여주기");
		
		String userId = (String) session.getAttribute("userId");
		UsersVO userVo = userService.selectByUserId(userId);
		model.addAttribute("userVo",userVo);
		
//		ResumesVO resumesVo=rsService.selectByRsno(resumeNo);
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

}//컨트롤러
