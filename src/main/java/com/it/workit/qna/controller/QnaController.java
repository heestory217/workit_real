package com.it.workit.qna.controller;


import java.util.HashMap;
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
import com.it.workit.qna.model.QnaService;
import com.it.workit.qna.model.QnaUsersVO;
import com.it.workit.qna.model.QnaVO;
import com.it.workit.users.model.UsersService;


@Controller
@RequestMapping("/qna")
public class QnaController {
	private static final Logger logger=LoggerFactory.getLogger(QnaController.class);

	@Autowired
	private QnaService qaService;

	@Autowired private UsersService userService;

	@RequestMapping("/qnaList.do")
	public String qnaList(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("리스트 화면출력, 파라미터 searchVo={}", searchVo);

		//2
		//[페이징 처리]
		PaginationInfo paging = new PaginationInfo();
		paging.setBlockSize(Utility.BLOCK_SIZE);
		paging.setRecordCountPerPage(Utility.RECORD_COUNT);
		paging.setCurrentPage(searchVo.getCurrentPage());

		//[2] SearchVo 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT);
		searchVo.setFirstRecordIndex(paging.getFirstRecordIndex());

		List<QnaVO> qalist=qaService.qaseletAll(searchVo);
		logger.info("글목록 조회 결과 qalist.size={}",qalist.size());

		int totalRecord = qaService.qaTotalRecord(searchVo);
		logger.info("총 글 개수 total={}", totalRecord);
		paging.setTotalRecord(totalRecord);


		//3
		model.addAttribute("qalist",qalist);
		model.addAttribute("paging", paging);

		//4
		return "qna/qnaList";
	}

	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.GET)
	public void qnaWrite_get() {
		logger.info("쓰기 화면 출력");
	}

	@RequestMapping(value = "/qnaWrite.do", method = RequestMethod.POST)
	public String qnaWrite_post(@ModelAttribute QnaVO qaVo,
			HttpSession session,
			Model model) {
		logger.info("글 등록 파라미터 qaVo={}",qaVo);

		//vo셋팅
		//String qaWriteno = (String)session.getAttribute("userNo");
		String userId = (String)session.getAttribute("userId");

		//qaVo.setQaWriteno(Integer.parseInt(qaWriteno));
		qaVo.setQaWriter(userId);

		//2
		int cnt = qaService.qaInsert(qaVo);
		logger.info("등록성공 cnt={}",cnt);

		String msg="등록실패 했습니다", url="/qna/qnaWrite.do";
		if (cnt>0) {
			msg="등록 성공 하였습니다";
			url="/qna/qnaList.do";
		}

		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		model.addAttribute("qaVo",qaVo);

		//4
		return "common/message";
	}

	//비밀번호 체크
	@RequestMapping(value= "/passwordCheck.do", method = RequestMethod.GET)
	public void qaPwCk_get() {
		//1
		logger.info("비밀번호 확인창");
	}

	@RequestMapping(value= "/passwordCheck.do", method = RequestMethod.POST)
	public String qaPwCk_post(@RequestParam(defaultValue = "0") int qaNo,
			@RequestParam String qaPassword,
			Model model) {
		//1
		logger.info("비밀번호 확인 파라미터 qaNo={}, qaPassword={}", qaNo,qaPassword);

		//2
		QnaUsersVO qauVo =qaService.qaSelectByNo(qaNo);


		String msg="비밀번호가 틀렸습니다", url="/qna/passwordCheck.do?qaNo="+qaNo;
		if (qauVo.getQaPassword().equals(qaPassword)) {
			qaService.qaViewCount(qaNo);
			msg="비밀번호가 일치합니다";
			url="/qna/qnaDetail.do?qaNo="+qaNo;
		}

		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		//4
		return "common/message";
	}

	@RequestMapping("/qnaCount.do")
	public String qnaCount(@RequestParam(defaultValue = "0") int qaNo,
			Model model) {
		//1
		logger.info("조회수 업 파라미터 qaNo={}",qaNo);
		if(qaNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/qna/qnaList.do");

			return "common/message";
		}
		//2
		qaService.qaViewCount(qaNo);
		//3

		//4
		return "redirect:/qna/qnaDetail.do?qaNo="+qaNo;
	}


	@RequestMapping("/qnaDetail.do")
	public String qnaDetail(@RequestParam(defaultValue = "0")int qaNo,
			Model model) {
		//1
		logger.info("디테일 페이지 qaNo={}",qaNo);

		//2
		QnaUsersVO qaVo=qaService.qaSelectByNo(qaNo);
		logger.info("디테일 페이지 화면 처리 qaVo={}",qaVo);

		//3
		model.addAttribute("qaVo",qaVo);

		//4
		return "qna/qnaDetail";
	}

	@RequestMapping( value = "/qnaDelete.do", method = RequestMethod.POST)
	public String qnaDelete(@ModelAttribute QnaVO qVo,	@RequestParam String userPassword, HttpSession session,
			Model model ) {
		//1
		logger.info("삭제 파라미터  qVo={}, userPasswoed={}",qVo,userPassword);

		//2

		QnaUsersVO qauVo = qaService.qaSelectByNo(qVo.getQaNo());
		logger.info("qauVo={}",qauVo);

		String msg="비밀번호가 틀렸습니다", url="/qna/qnaDetail.do?qaNo="+qVo.getQaNo();

		String userId = (String)session.getAttribute("userId");
		int result = userService.loginCheck(userId, userPassword);

		if (result==UsersService.LOGIN_OK) {
			Map<String, String> map = new HashMap<String, String>(); //맵에다 넣기
			map.put("QA_NO", qVo.getQaNo()+"");
			map.put("QA_GROUPNO", Integer.toString(qVo.getQaGroupno())); //스트링으로 변환
			map.put("QA_ORDERNO", String.valueOf(qVo.getQaOrderno())); //스트링으로 변환

			int cnt = qaService.qaDelete(map);
			logger.info("삭제 완 cnt={}",cnt);
			
			if(cnt>0){
				msg="삭제 성공 하였습니다";
				url="/qna/qnaList.do";
			}
		}

		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		//4
		return "common/message";
	}


	@RequestMapping(value="/qnaUpdate.do", method = RequestMethod.GET)
	public String qnaUpdate(@RequestParam(defaultValue = "0")int qaNo, @RequestParam String userPassword,
			HttpSession session, Model model) {
		logger.info("수정화면 파라미터 qaNo={},userPassword={}",qaNo,userPassword);
		String userId = (String)session.getAttribute("userId");

		//2
		int result = userService.loginCheck(userId, userPassword);

		QnaUsersVO qauVo = null;
		if (result==UsersService.LOGIN_OK) {
			qauVo = qaService.qaSelectByNo(qaNo);
			logger.info("처리결과 qauVo={}",qauVo);
		} else {
			model.addAttribute("msg", "비밀번호가 틀렸습니다.");
			model.addAttribute("url", "/qna/qnaDetail.do?qaNo="+qaNo);

			return "common/message";
		}

		//3
		model.addAttribute("qaVo",qauVo);

		//4
		return "qna/qnaUpdate";
	}

	@RequestMapping(value="/qnaUpdate.do", method = RequestMethod.POST)
	public String qnaUpdate(@ModelAttribute QnaUsersVO qaVo,
			Model model) {
		//1
		logger.info("수정처리 qaVo={}",qaVo);
		//2
		int cnt = qaService.qaUpdate(qaVo);

		String msg="수정 실패하였습니다", url="/qna/qnaUpdate.do?qaNo="+qaVo.getQaNo();
		if (cnt>0) {
			msg="수정 성공하였습니다";
			url="/qna/qnaDetail.do?qaNo="+qaVo.getQaNo();
		}
		//3
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		//4
		return "common/message";
	}

	@RequestMapping(value="/qnaReply.do", method = RequestMethod.GET)
	public String qnaReply(@RequestParam (defaultValue = "0") int qaNo,
			Model model) {
		//1
		logger.info("답변화면 처리 qaNo={}",qaNo);
		//2


		QnaUsersVO qauVo = qaService.qaSelectByNo(qaNo);
		logger.info("답변화면 처리 파라미터 qauVo",qauVo);
		//3
		model.addAttribute("qauVo",qauVo);
		//4
		return "qna/qnaReply";
	}

	@RequestMapping(value="/qnaReply.do", method = RequestMethod.POST)
	public String qnaReply_post (@ModelAttribute QnaUsersVO qauVo,HttpSession session) {
		//1
		logger.info("답변하기 qamVo={}", qauVo);
		//2
		int cnt= qaService.qaReply(qauVo);
		logger.info("답변하기 결과 cnt={}", cnt);
		//3

		//4
		return "redirect:/qna/qnaList.do";
	}
}
