package com.it.workit.applicant.controller;

import java.util.Iterator;
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
import com.it.workit.hrm.model.HrmResumePageVO;
import com.it.workit.prohibit.model.ProhibitJoinService;
import com.it.workit.prohibit.model.ProhibitJoinVO;

@Controller
@RequestMapping("/company/ApplicantMng")
public class CorpApplicantController {

	private static final Logger logger = LoggerFactory.getLogger(CorpApplicantController.class);
	@Autowired private ApplicantService appService;
	@Autowired private ProhibitJoinService prohibitService;
	
	@RequestMapping("/allApplicant.do")
	public void allApplicant(@ModelAttribute CorpApplicantPagingVO searchVo, HttpSession session, Model model){
		logger.info("전체 지원자 목록 보여주기");

		int userNo = (Integer) session.getAttribute("userNo");
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
		
		int totalRecord=appService.selectAllAppliedCount(userNo);
		logger.info("전체 지원자 수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		int prohibited = 0;
		Iterator<Map<String, Object>> iter = applist.iterator();
		while (iter.hasNext()) {
			Map<String, Object> map = iter.next();
			
			//java.lang.ClassCastException: java.math.BigDecimal cannot be cast to java.lang.Integer
			//지원제한자 여부
			int userPersonalNo = Integer.parseInt(String.valueOf(map.get("USER_NO")));
			if(userPersonalNo!=0) {
				int cnt = prohibitService.selectIfProhibited(userPersonalNo);
				if (cnt>0) {
					prohibited += 1;
					iter.remove();	//입사지원자 목록에서 제외
					break;
				}
			}
		}
		model.addAttribute("applist", applist);	//5개씩 출력됨
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("CountAllApplicant", totalRecord);
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
	
	@RequestMapping("/applicantByRecruit.do")
	public void applicantByRecruit(){}
	
	
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
	
	//입사지원제한자 등록처리
	@RequestMapping("/prohibit.do")
	public String prohibit(HttpSession session, @RequestParam (defaultValue = "0") int userNo, Model model){
		logger.info("입사지원제한자 등록처리, userNo={}", userNo);
		int userCorpNo = (Integer) session.getAttribute("userNo");
		
		if(userNo==0 || userCorpNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/company/ApplicantMng/allApplicant.do");
			return "common/message";
		}
		
		ProhibitJoinVO vo = new ProhibitJoinVO();
		vo.setUserCorpNo(userCorpNo);
		vo.setUserPersonalNo(userNo);
		int cnt = prohibitService.insertProhibit(vo);
		
		if(cnt>0) {
			model.addAttribute("msg", "해당 지원자가 입사지원제한자로 등록되었습니다.");
			model.addAttribute("url", "/company/ApplicantMng/allApplicant.do");
		}
		
		return "common/message";
	}
}
