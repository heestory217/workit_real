package com.it.workit.resumes.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.util.FileUtil;
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
import com.it.workit.corp.model.AreaListView;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.LanguageListView;
import com.it.workit.corpsearch.model.CorpSearchService;
import com.it.workit.indivsearch.model.IndivKeywordSearchVO;
import com.it.workit.indivsearch.model.IndivSearchService;
import com.it.workit.language.model.LanguageVO;
import com.it.workit.resumes.model.AreaVO;
import com.it.workit.resumes.model.AwardVO;
import com.it.workit.resumes.model.CarrerVO;
import com.it.workit.resumes.model.CorpuselanguageVO;
import com.it.workit.resumes.model.ForeignlanguageskillVO;
import com.it.workit.resumes.model.LicencseVO;
import com.it.workit.resumes.model.ResumeListVO;
import com.it.workit.resumes.model.ResumeOpen2VO;
import com.it.workit.resumes.model.ResumesAllVO;
import com.it.workit.resumes.model.ResumesService;
import com.it.workit.resumes.model.ResumesVO;
import com.it.workit.resumes.model.UserwantedworkareaVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;
import com.it.workit.users.model.arealistVO;

@Controller
@RequestMapping("/resumes")
public class ResumesController {

	private static final Logger logger
	=LoggerFactory.getLogger(ResumesController.class);

	@Autowired private ResumesService rsService;
	@Autowired private UsersService userService;
	@Autowired private CorpSearchService cosService;
	@Autowired private CorpService corpService;
	@Autowired private IndivSearchService indivSearchServie;
	@Autowired private FileUploadUtil fileUtil;

	@RequestMapping(value = "/resumesList.do", method = RequestMethod.GET)
	public String resumeList(HttpSession session, Model model) {
		logger.info("리스트 화면 처리");

		String userId = (String) session.getAttribute("userId");
		logger.info("userId={}",userId);

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


	//수정 화면
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
		if (awlist != null) {
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
		}

		//경력
		if (carrlist != null) {
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
		}

		//자격증
		if (licelist != null) {
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
		}

		//외국어
		if (flslist != null) {
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
		}
		
		//임시로 다시 업데이트
		if (resumeVo.getResumeResumeopencheck()==4) {
			rsService.upadteImsi(resumeNo);
		}

		String msg="등록 성공하였습니다", url="/resumes/resumeDetail.do?resumeNo="+resumeNo;

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);


		return "common/message";
	}

	
	//지역, 언어 받기 화면
	@RequestMapping(value = "/resumeExplore.do", method = RequestMethod.GET)
	public String indivExplore_get(@RequestParam(defaultValue = "0") int resumeNo,
			Model model) {
		logger.info("개인 - 채용 공고 탐색 보여주기 / get, 파라미터 resumeNo={}",resumeNo);

		/* 언어 기본데이터 */
		List<LanguageVO> Llist = indivSearchServie.selectLanguage();
		logger.info("Llist.size={}", Llist.size());

		model.addAttribute("Llist", Llist);

		/* 지역 기본데이터 */
		List<arealistVO> Alist = indivSearchServie.selectAreaList1();
		logger.info("Alist.size={}", Alist.size());
		model.addAttribute("Alist", Alist);

		/* 기본 데이터 - 선택 X */
		List<IndivKeywordSearchVO> list = indivSearchServie.selectSearchAll();
		logger.info("list.size={}", list.size());

		model.addAttribute("list", list);

		return "resumes/resumeExplore";
	}

	//지역, 언어 받기 기능 & 이력서 승인대기
	@RequestMapping(value = "/resumeExplore.do", method = RequestMethod.POST)
	public String indivExplore_post(@RequestParam(defaultValue = "0") int resumeNo,
			@ModelAttribute ResumeOpen2VO openVo,
			Model model) {

			logger.info("openVo={}",openVo);

			//vo에 셋팅하기
			List<Integer> langlist2 = openVo.getUserLanguage();
			logger.info("langlist2={}",langlist2);	//langlist2=[9, 13, 15, 16]
			logger.info("langlist2.size={}",langlist2.size());

			//langlist2=[9, 13, 15, 16]
			List<CorpuselanguageVO> listCLVo = new ArrayList<CorpuselanguageVO>();
			for (int i = 0; i < langlist2.size(); i++) {
				logger.info("{}번째 : {}",i,langlist2.get(i));
				int a = langlist2.get(i);

				logger.info("a={}",a);

				CorpuselanguageVO vo = new CorpuselanguageVO();

				//개별 브이오 세팅
				vo.setResumeNo(resumeNo);
				vo.setLanguageNo(langlist2.get(i));
				logger.info("vo={}",vo);

				//리스트 브이오에 더하기
				listCLVo.add(vo);

				int cnt = rsService.insertUserlang(vo);
				logger.info("언어 등록 cnt={}",cnt);
			}

			logger.info("listCLVo={}", listCLVo);


			List<String> areaList2 = openVo.getAreaAdd2();
			logger.info("areaList2={}",areaList2);

			List<UserwantedworkareaVO> listUWA = new ArrayList<UserwantedworkareaVO>();
	         List<AreaVO> alist = new ArrayList<AreaVO>();
	         for (int i = 0; i < areaList2.size(); i++) {
	            logger.info("{}번째 : {}",i,areaList2.get(i));
	            String al1 = areaList2.get(i);

	            logger.info("al1={}",al1);

	            AreaVO aVo = new AreaVO();
	            
	            //개별 브이오 세팅
	            aVo.setAreaAdd2(areaList2.get(i));
	            logger.info("aVo={}",aVo);
	            
	            //리스트에 더하기
	            alist.add(aVo);
	            logger.info("alist={}",alist);
	            
	            
	            String area1 ="";
	            int areaNo=0;
	            for (int j = 0; j < alist.size(); j++) {
	               alist = rsService.selectAreaNo(areaList2.get(i));
	               area1 = alist.get(j).getAreaAdd1();
	               areaNo = alist.get(j).getAreaNo();
	               
	               logger.info("area1={}",area1);
	               logger.info("areaNo={}",areaNo);
	            }
	            if (!alist.isEmpty()) {
	               //브이오 셋팅
	               UserwantedworkareaVO uaVo = new UserwantedworkareaVO();
	               //리스트에 추가
	               uaVo.setAreaNo(areaNo);
	               uaVo.setResumeNo(resumeNo);
	               
	               listUWA.add(uaVo);
	               
	               int cnt = rsService.insertUserArea(uaVo);
	               logger.info("지역 등록 cnt={}", cnt);
	            }
	            
	            
	         }
			
			int open = rsService.resumeOpen(resumeNo);
			logger.info("이력서 승인대기 open={}",open);
			
			logger.info("listUWA={}", listUWA);
			

			return "redirect:/resumes/resumesList.do";
	}


	//지원하기
	@RequestMapping(value="/resumeApply.do", method = RequestMethod.GET)
	public void resumeApply(HttpSession session,Model model) {
		logger.info("지원하기 화면");
		//2
		int userNo = (Integer)session.getAttribute("userNo");
		logger.info("유저 번호 userNo={}",userNo);

		UsersVO userVo = userService.selectByUserNo(userNo);
		
		List<ResumesVO> rlist= rsService.selectResumeByNo(userNo); 
		
		//3
		model.addAttribute("userVo",userVo);
		model.addAttribute("rlist",rlist);
		
	}
	
	//이력서 파일 업로드
	@RequestMapping(value="/rsfileUpload.do",method = RequestMethod.POST)
	public String rsfileUpload(@ModelAttribute ResumesVO rVo,
			HttpSession session,
			HttpServletRequest request) {
		logger.info("파일업로드");
		
//		String userId = (String) session.getAttribute("userId");
//		logger.info("userId={}",userId);
//		UsersVO userVo = userService.selectByUserId(userId);
//		int userNo=userVo.getUserNo();
//		logger.info("userNo={}",userNo);
		
		//파일업로드 처리
		String resumeFileoriginalname="", resumeFilename="";
		long resumeFilesize=0;
		try {
			List<Map<String, Object>> fileList 
				= fileUtil.fileUplaod(request, FileUploadUtil.PDS_TYPE);
			Map<String, Object> firstMap = fileList.get(0);
			resumeFilename = (String)firstMap.get("fileName");
			logger.info("로고 logoURL={}",resumeFilename);
			logger.info("로고 fileList.size()={}",fileList.size());
			
			for (Map<String,Object> fileMap:fileList) {
				resumeFileoriginalname=(String)fileMap.get("originalFileName");
				resumeFilename=(String)fileMap.get("fileName");
				resumeFilesize=(Long)fileMap.get("fileSize");
				
			}
		} catch (IllegalStateException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("파일 업로드 실패");
			e.printStackTrace();
		}
		//rVo.setUserNo(userNo);
		rVo.setResumeTitle(resumeFilename);
		rVo.setResumeFilename(resumeFilename);
		rVo.setResumeFilesize(resumeFilesize);
		rVo.setResumeFileoriginalname(resumeFileoriginalname);
		int cnt = rsService.insertRsfile(rVo);
		logger.info("파일업로드 결과 cnt={}", cnt);
		
		return "redirect:/resumes/resumesList.do";
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
		model.addAttribute("userNo", userNo);
	}

}//컨트롤러
