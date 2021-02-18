package com.it.workit.indivMypage.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

import com.it.workit.applicant.model.ApplicantService;
import com.it.workit.applicant.model.ApplicantlistVO;
import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SHA256Util;
import com.it.workit.common.Utility;
import com.it.workit.getposition.model.GetPositionService;
import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.orders.model.OrdersVO;
import com.it.workit.position.model.PositionService;
import com.it.workit.position.model.PositionsuggestVO;
import com.it.workit.recruitBookmark.model.RecruitBookmarkService;
import com.it.workit.recruitBookmark.model.RecruitannouncebookmarkVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/indivMypage")
public class IndivMypageController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndivMypageController.class);
	
	@Autowired private UsersService userService;
	@Autowired private ApplicantService applicantService;
	@Autowired private RecruitBookmarkService recruitBookmarkService;
	@Autowired private OrdersService ordersService;
	@Autowired private PositionService positionService;
	@Autowired private GetPositionService getPositionService;
	
	//비밀번호 입력 -> 수정화면을 거치기 위해서 단순 get방식은 indivCheckPwd로 리턴된다.
	@RequestMapping(value = "/indivMypageEdit.do", method = RequestMethod.GET)
	public String usersEdit_get() {
		
		logger.info("indivCheckPwd없이는 edit 창 진입불가, indivCheckPwd 리턴");
		return "indivMypage/indivCheckPwd";
	}
	
	@RequestMapping(value = "/indivMypageEdit.do", method = RequestMethod.POST)
	public String usersEdit_post(@ModelAttribute UsersVO vo, ModelMap model) {
		logger.info("개인 마이페이지 - 회원정보 수정 파라미터 vo={}",vo);
		
		String hp1=vo.getUserHp1();
		String hp2=vo.getUserHp2();
		String hp3=vo.getUserHp3();

		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			hp1="";
			hp2="";
			hp3="";
		}

		vo.setUserHp1(hp1);
		vo.setUserHp2(hp2);
		vo.setUserHp3(hp3);
		
		String msg="회원정보 수정에 실패했습니다.", url="/indivMypage/indivMypageEdit.do";
		logger.info("회원정보 수정 vo = {}",vo);
		int cnt=userService.updateUsers(vo);
		if(cnt>0) {
			msg="회원정보 수정 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping(value = "/indivCheckPwd.do", method = RequestMethod.GET)
	public String checkPwd_get() {
		logger.info("개인 마이페이지 - 비밀번호 체크 화면 보여주기");
		
		return "indivMypage/indivCheckPwd";
	}
	
	@RequestMapping(value = "/indivCheckPwd.do", method = RequestMethod.POST)
	public String checkPwd_post(@RequestParam(defaultValue = "0") String pwd, Model model,
			HttpSession session) {
		
		logger.info("개인 마이페이지 - 비밀번호 파라미터 확인 pwd={}", pwd);
		
		//세션 userid 가져오기
		String userid=(String) session.getAttribute("userId");
		int loginChk = userService.loginCheck(userid, pwd);
		
		String url="", msg="";
		if(loginChk==1) { //로그인 성공
			UsersVO vo=userService.selectByUserId(userid);
			
			model.addAttribute("vo", vo);
			return "indivMypage/indivMypageEdit";
		}else if(loginChk==2) {//비밀번호 오류
			msg="비밀번호가 틀립니다. 다시 시도해주세요.";
			url="/indivMypage/indivCheckPwd.do";
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
		}
		return "common/message";
	}
	
	@RequestMapping("/indivMypageSituation.do")
	public String situation(HttpSession session, Model model,
			@RequestParam(defaultValue = "0") int type, @ModelAttribute IndivpagingVO vo) {
		
		//세션 userno 가져오기
		int userNo=(Integer) session.getAttribute("userNo");
		
		logger.info("개인 마이페이지 - 지원현황 조회 / userNo={}",userNo);
		
		int applyCount=applicantService.selectApplyCountByUserNo(userNo);
		int passCount=applicantService.selectPassCountByUserNo(userNo);
		int failCount=applicantService.selectFailCountByUserNo(userNo);
		
		logger.info("개인 마이페이지 - 지원현황 조회 / applyCount={}",applyCount);
		logger.info("개인 마이페이지 - 지원현황 조회 / passCount={}",passCount);
		logger.info("개인 마이페이지 - 지원현황 조회 / failCount={}",failCount);
		
		model.addAttribute("applyCount", applyCount);
		model.addAttribute("passCount", passCount);
		model.addAttribute("failCount", failCount);
		
		vo.setUserNo(userNo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		int totalRecord=0;

		
		List<ApplicantlistVO> list=null;
		if(type==1) {
			list=applicantService.selectPassAllByUserNo(vo);
			totalRecord=passCount;
		}else if(type==2) {
			list=applicantService.selectFailAllByUserNo(vo);
			totalRecord=failCount;
		}else if(type==3) {
			list=applicantService.selectApplyAllByUserNo(vo);
			totalRecord=applyCount;
		}else {
			//type 값이 세팅이 되지 않았을 때
			
			String msg="잘못된 주소입니다. 다시 시도하세요", url="/index.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		
		logger.info("type ={}",type);
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "indivMypage/indivMypageSituation";
	}
	
	@RequestMapping("/indivBookmark.do")
	public String bookmark(HttpSession session, Model model,@ModelAttribute IndivpagingVO vo) {
		
		//세션 userno 가져오기
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("개인 마이페이지 - 채용북마크 화면 보여주기 / userno={}",userNo);
		
		vo.setUserNo(userNo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		int totalRecord=recruitBookmarkService.rBookMarkGetTotalRecord(vo);
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		
		List<RecruitannouncebookmarkVO> list=recruitBookmarkService.selectRecruitBookmark(vo);
		
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "indivMypage/indivBookmark";
	}
	
	@RequestMapping("/indivBookmarkDelete.do")
	public String deleteBookmark(@RequestParam(defaultValue = "0") int no, Model model) {
		logger.info("개인 마이페이지 - 북마크 삭제 / 북마크 no ={}",no);
		
		if(no==0) {
			String msg="잘못된 접근입니다. 다시 시도하세요", url="/indivMypage/indivBookmark.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
		String msg="북마크 삭제 실패했습니다.", url="/indivMypage/indivBookmark.do";
		int cnt=recruitBookmarkService.deleteBookmarkByRecruitNo(no);
		if(cnt>0) {
			msg="북마크가 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/indivPayment.do")
	public String payment(Model model,HttpSession session,
			@ModelAttribute IndivpagingVO vo) {
		//세션 userno 가져오기
		int userNo=(Integer) session.getAttribute("userNo");
		
		logger.info("개인 마이페이지 - 결제내역 view 보여주기 / userno={}",userNo);
		
		vo.setUserNo(userNo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		int totalRecord=ordersService.ordersGetTotalRecord(vo);
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		List<OrdersVO> list=ordersService.selectIndivPaymentByUserno(vo);
		
		logger.info("list.size={}",list.size());
		model.addAttribute("list",list);
		
		return "indivMypage/indivPayment";
	}
	
	@RequestMapping("/indivPosition.do")
	public String position(Model model,HttpSession session,
			@ModelAttribute IndivpagingVO vo) {
		//세션 userno 가져오기
		int userNo=(Integer) session.getAttribute("userNo");
		
		logger.info("개인 마이페이지 - 포지션 제안 view 보여주기 / userNo={}",userNo);
		
		vo.setUserNo(userNo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		int totalRecord=positionService.positionGetTotalRecord(vo);
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		
		List<PositionsuggestVO> list=positionService.selectPositionFlag2ByUserno(vo);
		
		logger.info("list.size={}",list.size());
		model.addAttribute("list", list);
		
		return "indivMypage/indivPosition";
	}
	
	@RequestMapping("/countUpdate.do")
	public String countUpdate(HttpSession session, @RequestParam (defaultValue = "0") int positionsuggestNo,Model model) {
		logger.info("제안 읽음 처리 getMessageNo={}", positionsuggestNo);

		if(positionsuggestNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indivMypage/indivPosition.do");
			return "common/message";
		}

		int cnt= getPositionService.updateReadCount(positionsuggestNo);
		logger.info("받은 제안 읽음처리 결과, cnt={}", cnt);

		return "redirect:/indivMypage/positionDetail.do?&positionsuggestNo="+positionsuggestNo;
	}
	
	//제안 상세보기
	@RequestMapping("/positionDetail.do")
	public String messageDetail_post(@RequestParam (defaultValue = "0") int positionsuggestNo, Model model) {
		logger.info("제안 상세보기");
		logger.info("파라미터 positionsuggestNo={}", positionsuggestNo);
		
		if(positionsuggestNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indivMypage/indivPosition.do");
			return "common/message";
		}

		Map<String, Object> map = positionService.selectByPositionNo(positionsuggestNo);
		logger.info("map={}", map);
		model.addAttribute("map", map);

		return "/indivMypage/indivPositionDetail";
	}
	
	//삭제하기
	@RequestMapping("/deletePSG.do")
	public String deletePSG(@RequestParam (defaultValue = "0") int positionsuggestNo,Model model) {
		logger.info("개별 제안 삭제하기 파라미터 positionsuggestNo={}", positionsuggestNo);

		String msg="잘못된 url입니다.", url="/indivMypage/indivPosition.do";
		if(positionsuggestNo==0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		int cnt=0;
		if(positionsuggestNo!=0) {
			cnt = getPositionService.deleteGetPSG(positionsuggestNo);
		}

		if(cnt>0) {
			msg="선택한 제안이 삭제되었습니다.";
		}else {
			msg="삭제 처리에 실패하였습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
}
