package com.it.workit.applicant.controller;

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
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.applicant.model.ApplicantService;
import com.it.workit.applicant.model.ApplicantlistVO;
import com.it.workit.applicant.model.CorpApplicantPagingVO;
import com.it.workit.common.PaginationInfo;
import com.it.workit.common.Utility;
import com.it.workit.prohibit.model.ProhibitJoinPagingVO;
import com.it.workit.prohibit.model.ProhibitJoinService;
import com.it.workit.prohibit.model.ProhibitJoinVO;
import com.it.workit.recruit.model.RecruitannounceService;
import com.it.workit.recruit.model.RecruitannounceVO;

@Controller
@RequestMapping("/company/ApplicantMng")
public class CorpApplicantController {

	private static final Logger logger = LoggerFactory.getLogger(CorpApplicantController.class);
	@Autowired private ApplicantService appService;
	@Autowired private ProhibitJoinService prohibitService;
	@Autowired private RecruitannounceService recruitService;
	
	@RequestMapping("/applicantByRecruit.do")
	public void applicantByRecruit(@ModelAttribute CorpApplicantPagingVO searchVo, HttpSession session, Model model){
		logger.info("지원자 목록 보여주기 (전체/공고별)");
		int userNo = (Integer) session.getAttribute("userNo");
		List<RecruitannounceVO> list = recruitService.selectAllRecruitList(userNo);
		model.addAttribute("list", list);
		
		searchVo.setUserNo(userNo);
		
		//페이징
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//전체 지원자 목록
		List<Map<String, Object>> applist = appService.selectAllApplicantView(searchVo);
		logger.info("전체 지원자 수 = {}", applist.size());
		
		int totalRecord=appService.selectAllAppliedCount(searchVo);
		logger.info("전체 지원자 수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		int pass = appService.selectPassCount(searchVo);
		int fail = appService.selectFailCount(searchVo);
		int open = appService.selectReadCount(searchVo);
		int prohibited = prohibitService.selectProhibitTotal(userNo);
		logger.info("prohibited={}", prohibited);
		
		model.addAttribute("applist", applist);	//5개씩 출력됨
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("CountAllApplicant", totalRecord);
		
		model.addAttribute("pass", pass);
		model.addAttribute("fail", fail);
		model.addAttribute("open", open);
		model.addAttribute("prohibited", prohibited);
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(@RequestParam (defaultValue = "0") int applicantlistNo,
			/*@RequestParam (required = false) String type,*/ Model model) {
		logger.info("지원 이력서 읽음 처리 applicantlistNo={}", applicantlistNo);

		if(applicantlistNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/company/ApplicantMng/allApplicant.do");
			return "common/message";
		}
		int cnt= appService.updateReadCount(applicantlistNo);
		logger.info("지원 이력서 읽음처리 결과, cnt={}", cnt);
		
		ApplicantlistVO vo = appService.selectOneApplication(applicantlistNo);
		
		return "redirect:/resumes/resumeDetail.do?resumeNo="+vo.getResumeNo()+"&type=Applied&applicantlistNo="+applicantlistNo;
	}
	
	//합격처리
	@RequestMapping("/pass.do")
	public String pass(@RequestParam (defaultValue = "0") int resumeNo, 
			@RequestParam (defaultValue = "0") int applicantlistNo, Model model){
		logger.info("지원 이력서 합격 처리, resumeNo={}, applicantlistNo={}", resumeNo, applicantlistNo);
		
		if(applicantlistNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}
		
		int cnt = appService.updaeApplyPass(applicantlistNo);
		logger.info("합격처리 결과 cnt={}", cnt);

		if(cnt>0) {
			model.addAttribute("msg", "해당 지원 이력서가 합격 처리되었습니다.");
			model.addAttribute("url", "/resumes/resumeDetail.do?resumeNo="+resumeNo+"&type=Applied&applicantlistNo="+applicantlistNo);
		}
		
		return "common/message";
	}
	
	//불합격 처리
	@RequestMapping("/fail.do")
	public String fail(@RequestParam (defaultValue = "0") int resumeNo, 
			@RequestParam (defaultValue = "0") int applicantlistNo, Model model){
		logger.info("지원 이력서 불합격 처리, resumeNo={}, applicantlistNo={}", resumeNo, applicantlistNo);
		
		if(applicantlistNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/index.do");
			return "common/message";
		}
		
		int cnt = appService.updaeApplyFail(applicantlistNo);
		logger.info("불합격 처리 결과 cnt={}", cnt);
		
		if(cnt>0) {
			model.addAttribute("msg", "해당 지원 이력서가 불합격 처리되었습니다.");
			model.addAttribute("url", "/resumes/resumeDetail.do?resumeNo="+resumeNo+"&type=Applied&applicantlistNo="+applicantlistNo);
		}
		
		return "common/message";
	}
	
	@RequestMapping("/prohibit.do")
	public String prohibit(@ModelAttribute ProhibitJoinPagingVO searchVo, HttpSession session, 
			@RequestParam (defaultValue = "0") int userNo, Model model){
		logger.info("입사지원제한자 페이지 보여주기");
		if(session.getAttribute("userNo")==null) {
			model.addAttribute("msg", "기업회원으로 로그인 후 이용가능합니다.");
			model.addAttribute("url", "/users/login.do");
			return "common/message";
		}
		int userCorpNo = (Integer) session.getAttribute("userNo");
		searchVo.setUserCorpNo(userCorpNo);
		
		//페이징
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//전체 지원자 목록
		int totalRecord=prohibitService.selectProhibitTotal(userCorpNo);
		logger.info("전체 입사제한자 수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
				
		List<Map<String, Object>> list = prohibitService.selectProhibitedList(searchVo);
		if(userNo!=0) {
			logger.info("입사지원제한자 등록처리, userNo={}", userNo);

			ProhibitJoinVO vo = new ProhibitJoinVO();
			vo.setUserCorpNo(userCorpNo);
			vo.setUserIndivNo(userNo);
			int cnt = prohibitService.insertProhibit(vo);
			
			if(cnt>0) {
				model.addAttribute("msg", "해당 지원자가 입사지원제한자로 등록되었습니다.");
				model.addAttribute("url", "/company/ApplicantMng/applicantByRecruit.do");
				return "common/message";
			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "/company/ApplicantMng/prohibit";
	}
	
	@RequestMapping("/prohibitCancel.do")
	public String prohibitCancel(@RequestParam (defaultValue = "0") int prohibitjoinNo, Model model){
		logger.info("입사지원취소 prohibitjoinNo={}", prohibitjoinNo);

		if(prohibitjoinNo!=0) {
			int cnt = prohibitService.deleteFromProhibit(prohibitjoinNo);
			logger.info("입사지원제한자 취소 처리 결과 cnt={}", cnt);
		}
		
		return "redirect:/company/ApplicantMng/prohibit.do";
	}
}
