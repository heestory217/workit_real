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

import com.it.workit.corp.model.AreaListView;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.LanguageListView;
import com.it.workit.corpsearch.model.CorpSearchService;
import com.it.workit.resumes.model.AwardVO;
import com.it.workit.resumes.model.CarrerVO;
import com.it.workit.resumes.model.ForeignlanguageskillVO;
import com.it.workit.resumes.model.LicencseVO;
import com.it.workit.resumes.model.ResumeListVO;
import com.it.workit.resumes.model.ResumesAllVO;
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
	@Autowired private CorpSearchService cosService;
	@Autowired private CorpService corpService;

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
		logger.info("이력서 한번에 받아오기 relistVo={}", relistVo);
		logger.info("이력서 resumeVo={}", resumeVo);

		//이력서 넣기
		int resumResult = rsService.insertResume(resumeVo);
		logger.info("이력서 resumResult={}",resumResult);
		int resumeNo = resumeVo.getResumeNo();	// 등록된 이력서에서 번호 추출
		logger.info("resumNo={}",resumeNo);

		//이력서 리스트 브이오의 각 멤버변수에 이력서번호 세팅
		List<AwardVO> awlist = relistVo.getAwardVOList();
		if (awlist != null) {
			for(AwardVO vo : awlist) {
				vo.setResumeNo(resumeNo);
			}
		}

		List<CarrerVO> carrlist = relistVo.getCarrerVOList();
		if (carrlist != null) {
			for (CarrerVO vo : carrlist) {
				vo.setResumeNo(resumeNo);
			}
		}
		
		List<ForeignlanguageskillVO> flslist = relistVo.getForeignskillVO();
		if (flslist != null) {
			for (ForeignlanguageskillVO vo : flslist) {
				vo.setResumeNo(resumeNo);
			}
		}
		
		List<LicencseVO> licelist = relistVo.getLicenVOList();
		if (licelist != null) {
			for (LicencseVO vo : licelist) {
				vo.setResumeNo(resumeNo);
			}
		}

		relistVo.setAwardVOList(awlist);
		relistVo.setCarrerVOList(carrlist);
		relistVo.setForeignskillVO(flslist);
		relistVo.setLicenVOList(licelist);

		logger.info("awlist={}",awlist);
		logger.info("carrlist={}",carrlist);
		logger.info("flslist={}",flslist);
		logger.info("licelist={}",licelist);

		//이력서가 등록되면 다른것들도 넣어라
		String msg="등록 성공하였습니다", url="/resumes/resumeDetail.do?resumeNo="+resumeVo.getResumeNo();
		if (resumResult>0) {
				if (awlist != null) {
					for (int i = 0; i < awlist.size(); i++) {
						AwardVO aVo = awlist.get(i);
						logger.info("aVo={}",aVo);
						
						rsService.insertAward(aVo);
					}
				}
				if (carrlist != null) {
					for (int i = 0; i < carrlist.size(); i++) {
						CarrerVO cVo = carrlist.get(i);
						logger.info("cVo={}",cVo);
						
						rsService.insertCarrer(cVo);
					}
				}
				if (flslist != null) {
					for (int i = 0; i < flslist.size(); i++) {
						ForeignlanguageskillVO fVo = flslist.get(i);
						logger.info("fVo={}",fVo);
						
						rsService.insertForeignskill(fVo);
					}
				}
				if (licelist != null) {
					for (int i = 0; i < licelist.size(); i++) {
						LicencseVO lVo = licelist.get(i);
						logger.info("lVo={}",lVo);
						
						rsService.insertLicen(lVo);
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
	
	//삭제
	@RequestMapping("/deleteResumes.do")
	public String deleteResumes(@RequestParam(defaultValue = "0") int resumeNo,
			Model model) {
		//1
		logger.info("삭제 파라미터 resumeNo={}",resumeNo);
		//2
		int cnt = rsService.deleteResumes(resumeNo);
		logger.info("삭제 처리 cnt={}",cnt);
		
		String msg= "삭제 실패하였습니다", url ="/resumes/resumeDetail.do?resumeNo="+resumeNo;
		if (cnt>0) {
			msg="삭제 성공하였습니다";
			url="/resumes/resumesList.do";
		}
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		//4
		return "common/message";
	}
	
	
	//수정
	@RequestMapping(value = "/resumeUpdate.do", method = RequestMethod.GET)
	public void updateResume_get(@RequestParam(defaultValue = "0") int resumeNo,
			HttpSession session, Model model) {
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
	
	@RequestMapping(value = "/resumeUpdate.do", method = RequestMethod.POST)
	public String updateResume_post(@ModelAttribute ResumesVO resumeVo,
			@ModelAttribute ResumeListVO relistVo, Model model) {
		logger.info("이력서 수정처리 진행");
		logger.info("이력서 한번에 받아오기 relistVo={}", relistVo);
		logger.info("이력서 resumeVo={}", resumeVo);
		
		/* resumeVo 업데이트 처리 */
		int cntupdate = rsService.updateResume(resumeVo);
		logger.info("resumeVo업데이트 cntupdate={}",cntupdate);
		
		/* 4개 테이블 이력서 번호 세팅하기*/
		int resumeNo = resumeVo.getResumeNo();
		logger.info("resumeNo={}",resumeNo);
		
		List<AwardVO> awlist = relistVo.getAwardVOList();
		if (awlist != null) {
			for(AwardVO vo : awlist) {
				vo.setResumeNo(resumeNo);
			}
			//relistVo.setAwardVOList(awlist);
		}
		List<CarrerVO> carrlist = relistVo.getCarrerVOList();
		if (carrlist != null) {
			for (CarrerVO vo : carrlist) {
				vo.setResumeNo(resumeNo);
			}
			//relistVo.setCarrerVOList(carrlist);
		}
		List<ForeignlanguageskillVO> flslist = relistVo.getForeignskillVO();
		if (flslist != null) {
			for (ForeignlanguageskillVO vo : flslist) {
				vo.setResumeNo(resumeNo);
			}
			//relistVo.setForeignskillVO(flslist);
		}
		List<LicencseVO> licelist = relistVo.getLicenVOList();
		if (licelist != null) {
			for (LicencseVO vo : licelist) {
				vo.setResumeNo(resumeNo);
			}
			//relistVo.setLicenVOList(licelist);
		}
		
		relistVo.setAwardVOList(awlist);
		relistVo.setCarrerVOList(carrlist);
		relistVo.setForeignskillVO(flslist);
		relistVo.setLicenVOList(licelist);

		logger.info("awlist={}",awlist);
		logger.info("carrlist={}",carrlist);
		logger.info("flslist={}",flslist);
		logger.info("licelist={}",licelist);
		
		//리스트 각 번호에 접근
		//int awardNo = awlist.get(0).getAwardNo();
		//logger.info("awardNo={}",awardNo);
		
		//수상
		for (int i = 0; i < awlist.size(); i++) {
			int awardNo = awlist.get(i).getAwardNo();

			AwardVO aVo = awlist.get(i);
			logger.info("aVo={}",aVo);
			
			if (awardNo==0) {
				rsService.insertAward(aVo);
			} else {
				rsService.updateAwd(aVo);
			}
		}

		//경력
		for (int i = 0; i < carrlist.size(); i++) {
			int carrerNo = carrlist.get(i).getCarrerNo();

			CarrerVO cVo = carrlist.get(i);
			logger.info("cVo={}",cVo);
			
			if (carrerNo==0) {
				rsService.insertCarrer(cVo);
			} else {
				rsService.updateCarrer(cVo);
			}
		}
		
		//자격증
		for (int i = 0; i < licelist.size(); i++) {
			int licencseNo = licelist.get(i).getLicencseNo();
			
			LicencseVO lVo = licelist.get(i);
			logger.info("lVo={}",lVo);
			
			if (licencseNo==0) {
				rsService.insertLicen(lVo);
			} else {
				rsService.updateLicen(lVo);
			}
		}
		
		//외국어
		for (int i = 0; i < flslist.size(); i++) {
			int foreignlanguageskillNo = flslist.get(i).getForeignlanguageskillNo();
			
			ForeignlanguageskillVO fVo = flslist.get(i);
			logger.info("fVo={}",fVo);
			
			if (foreignlanguageskillNo==0) {
				rsService.insertForeignskill(fVo);
			} else {
				rsService.updateFskill(fVo);
			}
		}
		
		String msg="등록 성공하였습니다", url="/resumes/resumeDetail.do?resumeNo="+resumeNo;

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		
		return "common/message";
	}
	
	
	//지원하기
	@RequestMapping("/resumeApply.do")
	public void resumeApply() {
		logger.info("지원하기");
	}
	
	
	
	
	//[수하]이력서 열람시 미구매자 팝업창 :머지할때 겹치면 제일 하단에 놔주세요//
	@RequestMapping("/resumePurchase.do")
	public void resumePurchase(@RequestParam int resumeNo, HttpSession session, Model model) {
		int userNo = (Integer)session.getAttribute("userNo");
		logger.info("userNo={}, resumeNo={}",userNo,resumeNo);
		ResumesAllVO vo = cosService.searchDefault(resumeNo);
		
		List<LanguageListView> langList = corpService.selectLanguageList(resumeNo);
		List<AreaListView> areaList = corpService.selectAreaList(resumeNo);
		int userNoForResume = vo.getResumesVo().getUserNo();
		UsersVO userVo = userService.selectByUserNo(userNoForResume);
		String userExp = userVo.getUserExperience();
		vo.setAreaList(areaList);
		vo.setLangList(langList);
		vo.setUserExperience(userExp);
		
		logger.info("ResumesAllVO={}",vo);
		model.addAttribute("resumeVo", vo);
	}

}//컨트롤러
