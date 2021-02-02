package com.it.workit.resumes.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.workit.resumes.model.AwardVO;
import com.it.workit.resumes.model.CarrerVO;
import com.it.workit.resumes.model.ForeignlanguageskillVO;
import com.it.workit.resumes.model.LicencseVO;
import com.it.workit.resumes.model.ResumeListVO;
import com.it.workit.resumes.model.ResumesService;
import com.it.workit.resumes.model.ResumesVO;

@Controller
@RequestMapping("/resumes")
public class ResumesController {

	private static final Logger logger
	=LoggerFactory.getLogger(ResumesController.class);

	@Autowired private ResumesService rsService;


	@RequestMapping(value = "/resumesList.do", method = RequestMethod.GET)
	public void resumeList() {
		logger.info("리스트 화면 처리");
	}

	@RequestMapping(value ="/resumeWrite.do", method = RequestMethod.GET)
	public void resumeWrite_get() {
		logger.info("이력서 쓰기 화면");
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

		//List<AwardVO> awlist = relistVo.getAwardVOList();
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


}//컨트롤러
