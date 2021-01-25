package com.it.workit.community.controller;

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

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.common.Utility;
import com.it.workit.question.model.QstnPagingVO;
import com.it.workit.question.model.QuestionService;
import com.it.workit.question.model.QuestionVO;

@Controller
@RequestMapping("/indiv/community")
public class CommunityController {
	private static final Logger logger
		=LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired QuestionService qstnService;
	

	//커뮤니티 메뉴
	@RequestMapping("/cmtyNavbar.do")
	public void sideMenu() {
		logger.info("커뮤니티 메뉴 화면");
	}

	//회원 활동 내역 조회
	@RequestMapping(value="/myProfile.do", method = RequestMethod.GET)	
	public String profile(HttpSession session, Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("회원 활동 내역 조회, userNo={}", userNo);
		
		List<Map<String, Object>> qstnList=qstnService.selectUserQstnAll(userNo);
		logger.info("활동 내역 조회 결과, qstnList.size={}", qstnList.size());
		
		model.addAttribute("qstnList", qstnList);
		
		return "indiv/community/myProfile";
		
	}
	
	//회원 질문 조회
	@RequestMapping("/myQstn.do")
	public String userQstnList(@ModelAttribute QstnPagingVO vo,
				HttpSession session, Model model) {
		int userNo=(Integer)session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("회원 질문 목록 조회, userNo={}", userNo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		int totalRecord=qstnService.getTotalRecord(vo);
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);

		
		List<Map<String, Object>> qstnList=qstnService.selectAllQuestion(vo);
		logger.info("회원 질문 목록 조회 결과, qstnLis.size={}", qstnList.size());
		
		model.addAttribute("qstnList", qstnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "indiv/community/myQstn";
	}
	
	//전체 질문 조회
	@RequestMapping("/qstnList.do")
	public String qstnList(@ModelAttribute QstnPagingVO vo, Model model) {
		logger.info("질문 전체 조회, 파라미터 vo={}", vo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		int totalRecord=qstnService.getTotalRecord(vo);
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		//List<QuestionVO> qstnList=qstnService.selectAllQstn();
		List<Map<String, Object>> qstnList=qstnService.selectAllQuestion(vo);
		logger.info("질문 전체 조회 결과, qstnList.size={}", qstnList.size());
		
		model.addAttribute("qstnList", qstnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "indiv/community/qstnList";
	}
	
	//질문 상세페이지
	@RequestMapping("/qstnDetail.do")
	public String qstnDetail(@RequestParam(defaultValue = "0") int qstnNo, Model model) {
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
	

	//질문 등록 화면
	@RequestMapping(value="/qstnWrite.do", method = RequestMethod.GET)
	public void qstnWrite_get() {
		logger.info("질문 등록 화면");
	}


	//질문 등록 처리
	@RequestMapping(value="/qstnWrite.do", method = RequestMethod.POST)
	public String qstnWrite_post(@ModelAttribute QuestionVO vo, HttpSession session, 
			Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("질문 등록, 파라미터 vo={}", vo);
		
		int cnt=qstnService.insertQstn(vo);
		logger.info("질문 등록 결과, cnt={}", cnt);
		String msg="질문 등록에 실패하였습니다.\\n다시 작성해주세요", 
				url="/indiv/community/qstnWrite.do";
		if(cnt>0) {
			msg="질문이 등록되었습니다.";
			url="/indiv/community/myQstn.do?userNo="+userNo;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//질문 수정 화면
	@RequestMapping(value="/qstnEdit.do", method = RequestMethod.GET)
	public String qstnEdit_get(@RequestParam(defaultValue = "0") int qstnNo,
			Model model) {
		logger.info("질문 수정 화면, 파라미터 qstnNo={}", qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnDetail.do?qstnNo="+qstnNo);
			
			return "common/message";
		}
		
		QuestionVO qstnVo = qstnService.selectQstn(qstnNo);
		logger.info("질문 조회 결과, qstnVo={}",qstnVo);
		
		model.addAttribute("qstnVo", qstnVo);
		
		return "indiv/community/qstnEdit";
	}
	
	//질문 수정 처리
	@RequestMapping(value="/qstnEdit.do", method = RequestMethod.POST)
	public String qstnEdit_post(@ModelAttribute QuestionVO vo, HttpSession session,
			Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("질문 수정 처리, 파라미터 vo={}", vo);
		
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
	
	//질문 삭제
	@RequestMapping("/qstnDelete.do")
	public String qstnDel(@RequestParam(defaultValue = "0")int qstnNo, Model model) {
		logger.info("질문 삭제, 파라미터 qstnNo={}", qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnDetail.do?qstnNo="+qstnNo);
		}
		
		int cnt=qstnService.deleteQstn(qstnNo);
		String msg="질문 삭제에 실패하였습니다.",
				url ="/indiv/community/qstnEdit.do?qstnNo="+qstnNo;
		if(cnt>0) {
			msg="질문이 삭제되었습니다.";
			url ="/indiv/community/qstnList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
		
	/*


	
	*/
	
}
