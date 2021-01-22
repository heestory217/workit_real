package com.it.workit.community.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.question.model.QuestionService;
import com.it.workit.question.model.QuestionVO;

@Controller
@RequestMapping("/indiv/community")
public class CommunityController {
	private static final Logger logger
		=LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired QuestionService qstnService;
	
	@RequestMapping("/cmtyNavbar.do")
	public String sideNav() {
		logger.info("커뮤니티 사이드 메뉴바");
		
		return "indiv/community/cmtyNavbar";
	}
	
	@RequestMapping("/myQstn.do")
	public String myQstn() {
		logger.info("나의 질문 페이지 화면");
		
		return "indiv/community/myQstn";
	}
	
	//회원 활동 내역
	@RequestMapping("/myProfile.do")
	public void profile() {
		logger.info("활동 내역 페이지 ");
	}
	
	//질문 등록 화면
	@RequestMapping(value="/qstnWrite.do", method = RequestMethod.GET)
	public void qstnWrite_get() {
		logger.info("질문 등록 화면");
	}

	//질문 등록 처리
	@RequestMapping(value="/qstnWrite.do", method = RequestMethod.POST)
	public String qstnWrite_post(@ModelAttribute QuestionVO vo, Model model) {
		logger.info("질문 등록, 파라미터 vo={}", vo);
		
		int cnt=qstnService.insertQstn(vo);
		logger.info("질문 등록 결과, cnt={}", cnt);
		String msg="질문 등록에 실패하였습니다.\\n다시 작성해주세요", 
				url="/indiv/community/qstnWrite.do";
		if(cnt>0) {
			msg="질문이 등록되었습니다.";
			url="/indiv/community/myQstn.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//질문 상세페이지
	@RequestMapping("/qstnDetail.do")
	public String qstnDetail(@RequestParam(defaultValue = "0") int qstnNo,
			Model model) {
		logger.info("질문 상세 페이지, 파라미터 qstnNo={}", qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnList.do");
			
			return "common/message";
		}
		
		QuestionVO qstnVo = qstnService.selectQstn(qstnNo);
		logger.info("질문 조회 결과, qstnVo={}",qstnVo);
		
		model.addAttribute("qstnVo", qstnVo);
		
		return "indiv/community/qstnDetail";
	}
	
	//질문 수정 화면
	@RequestMapping(value="/qstnEdit.do", method = RequestMethod.GET)
	public String qstnEdit_get(@RequestParam(defaultValue = "0") int qstnNo,
			Model model) {
		logger.info("질문 수정 화면, 파라미터 qstnNo={}", qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnDetail.do");
			
			return "common/message";
		}
		
		QuestionVO qstnVo = qstnService.selectQstn(qstnNo);
		logger.info("질문 조회 결과, qstnVo={}",qstnVo);
		
		model.addAttribute("qstnVo", qstnVo);
		
		return "indiv/community/qstnEdit";
	}
	
	//질문 수정 처리
	@RequestMapping(value="/qstnEdit.do", method = RequestMethod.POST)
	public String qstnEdit_post(@ModelAttribute QuestionVO vo,
			Model model) {
		logger.info("질문 수정 화면, 파라미터 vo={}, no={}", vo, vo.getQuestionNo());
		
		int cnt=qstnService.updateQstn(vo);
		logger.info("질문 수정 결과, cnt={}", cnt);
		String msg="질문 수정에 실패하였습니다. 다시 입력해주세요",
				url ="/indiv/community/qstnEdit.do?qstnNo="+vo.getQuestionNo();
		if(cnt>0) {
			msg="질문이 수정되었습니다.";
			url="/indiv/community/qstnDetail.do?qstnNo="+vo.getQuestionNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	@RequestMapping("/qstnList.do")
	public String qstnList(Model model) {
		logger.info("질문 전체 조회");
		
		List<QuestionVO> qstnList=qstnService.selectAllQstn();
		logger.info("질문 전체 조회 결과, qstnList.size={}", qstnList.size());
		
		model.addAttribute("qstnList", qstnList);
		
		return "indiv/community/qstnList";
	}
}
