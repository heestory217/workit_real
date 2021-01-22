package com.it.workit.indivMypage.controller;

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

import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/indivMypage")
public class IndivMypageController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndivMypageController.class);
	
	@Autowired private UsersService userService;
	
	//비밀번호 입력 -> 수정화면을 거치기 위해서 단순 get방식은 indivCheckPwd로 리턴된다.
	@RequestMapping(value = "/indivMypageEdit.do", method = RequestMethod.GET)
	public String usersEdit_get() {
		//세션 userid 가져오기
		//String userid=(String) session.getAttribute("userId");
		//String userid="kang";	//임시
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
		//String userid="kang";
		
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
	public String situation() {
		logger.info("개인 마이페이지 - 지원현황 조회");
		
		return "indivMypage/indivMypageSituation";
	}
	
}
