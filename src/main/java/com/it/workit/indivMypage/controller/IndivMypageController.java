package com.it.workit.indivMypage.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/indivMypage")
public class IndivMypageController {
	private static final Logger logger
		=LoggerFactory.getLogger(IndivMypageController.class);
	
	@Autowired private UsersService userService;
	
	@RequestMapping(value = "/indivMypageEdit.do", method = RequestMethod.GET)
	public String usersEdit_get(Model model) {
		//세션 userid 가져오기
		//String userid=(String) session.getAttribute("userid");
		String userid="kang";	//임시
		logger.info("개인 마이페이지 - 수정 화면 보여주기 / 파라미터 userid = {}",userid);
		
		UsersVO vo=userService.selectByUserId(userid);
		logger.info("마이페이지 - 회원 수정 페이지 / 조회 결과 vo={}", vo);
		
		model.addAttribute("vo", vo);
		
		return "indivMypage/indivMypageEdit";
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
	
}
