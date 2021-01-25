package com.it.workit.indivMypage.controller;


import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.applicant.model.ApplicantService;
import com.it.workit.applicant.model.ApplicantlistVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/indivMypage")
public class IndivMypageController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndivMypageController.class);
	
	@Autowired private UsersService userService;
	@Autowired private ApplicantService applicantService;
	
	//비밀번호 입력 -> 수정화면을 거치기 위해서 단순 get방식은 indivCheckPwd로 리턴된다.
	@RequestMapping(value = "/indivMypageEdit.do", method = RequestMethod.GET)
	public String usersEdit_get() {
		//세션 userid 가져오기
		//String userid=(String) session.getAttribute("userId");
		//logger.info("개인 마이페이지 - 수정 화면 보여주기 / 파라미터 userid = {}",userid);
		
		//UsersVO vo=userService.selectByUserId(userid);
		//logger.info("마이페이지 - 회원 수정 페이지 / 조회 결과 vo={}", vo);
		
		//model.addAttribute("vo", vo);
		
		//return "indivMypage/indivMypageEdit";
		
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
		
		UsersVO vo=userService.selectByUserId(userid);
		logger.info("개인 마이페이지 - 비밀번호 체크 / DB pwd 조회 결과 pwd={}", vo.getUserPassword());
		
		if(vo.getUserPassword().equals(pwd)) {
			
			model.addAttribute("vo", vo);
			
			return "indivMypage/indivMypageEdit";
		}else {
			String msg="비밀번호가 틀립니다. 다시 시도해주세요.", url="/indivMypage/indivCheckPwd.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
	}
	
	@RequestMapping("/indivMypageSituation.do")
	public String situation(HttpSession session, Model model,
			@RequestParam(defaultValue = "0") int type) {
		
		//세션 userid 가져오기
		int userno=(Integer) session.getAttribute("userNo");
		String userid=(String) session.getAttribute("userId");	//null체크용
		
		logger.info("개인 마이페이지 - 지원현황 조회 / userNo={}",userno);
		
		if(userid==null || userid.isEmpty()) { //이거오류나서 테스트 해야함
			//비 로그인 상태일때
			
			String msg="로그인 상태일 때 접근 가능합니다.", url="/users/login.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
		int applyCount=applicantService.selectApplyCountByUserNo(userno);
		int passCount=applicantService.selectPassCountByUserNo(userno);
		int failCount=applicantService.selectFailCountByUserNo(userno);
		
		logger.info("개인 마이페이지 - 지원현황 조회 / applyCount={}",applyCount);
		logger.info("개인 마이페이지 - 지원현황 조회 / passCount={}",passCount);
		logger.info("개인 마이페이지 - 지원현황 조회 / failCount={}",failCount);
		
		model.addAttribute("applyCount", applyCount);
		model.addAttribute("passCount", passCount);
		model.addAttribute("failCount", failCount);
		
		List<ApplicantlistVO> list=null;
		if(type==1) {
			list=applicantService.selectPassAllByUserNo(userno);
		}else if(type==2) {
			list=applicantService.selectFailAllByUserNo(userno);
		}else if(type==3) {
			list=applicantService.selectApplyAllByUserNo(userno);
		}else {
			//비 로그인 상태일때
			
			String msg="로그인 상태일 때 접근 가능합니다.", url="/index.do";
			
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);

			return "common/message";
		}
		
		logger.info("type ={}",type);
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		return "indivMypage/indivMypageSituation";
	}
	
	@RequestMapping("indivBookmark.do")
	public String bookmark() {
		logger.info("개인 마이페이지 - 채용북마크 화면 보여주기");
		
		return "indivMypage/indivBookmark";
	}
}
