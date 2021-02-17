package com.it.workit.community.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.commentRespond.model.CommentRespondService;
import com.it.workit.commentRespond.model.CommentRespondVO;
import com.it.workit.comments.model.CommentsService;
import com.it.workit.comments.model.CommentsVO;
import com.it.workit.common.PaginationInfo;
import com.it.workit.common.Utility;
import com.it.workit.getmessage.model.GetMessageVO;
import com.it.workit.message.model.MessageVO;
import com.it.workit.question.model.BookmarkVO;
import com.it.workit.question.model.QstnPagingVO;
import com.it.workit.question.model.QuestionService;
import com.it.workit.question.model.QuestionVO;
import com.it.workit.question.model.WorkkindVO;

@Controller
@RequestMapping("/indiv/community")
public class CommunityController {
	private static final Logger logger
		=LoggerFactory.getLogger(CommunityController.class);
	
	@Autowired QuestionService qstnService;
	@Autowired CommentRespondService comntService;
	@Autowired CommentsService replyService;

	//커뮤니티 메뉴
	@RequestMapping("/cmtyNavbar.do")
	public String sideMenu(@RequestParam(defaultValue = "0")int userNo, Model model) {
		logger.info("커뮤니티 메뉴 화면");
		QstnPagingVO vo=new QstnPagingVO();
		vo.setUserNo(userNo);
		vo.setQuestionImmsave(2);
		
		//질문 개수
		int totalRecord=qstnService.getTotalRecord(vo);
		logger.info("회원 질문 개수, totalRecord={}",totalRecord);
		model.addAttribute("totalRecord", totalRecord);
		
		//답변 개수
		int totalCmt=comntService.getTotalUserCmt(vo);
		logger.info("총 답변 개수, totalCmt={}", totalCmt);
		model.addAttribute("totalCmt", totalCmt);
		/*
		 * //회원 직무 조회 WorkkindVO workVo = qstnService.selectUserWorkkind(userNo); int
		 * userWorkkindNo=workVo.getWorkkindNo(); logger.info("회원 직무 userWorkkindNo={}",
		 * userWorkkindNo); model.addAttribute("userWorkkindNo", userWorkkindNo);
		 */
		return "indiv/community/cmtyNavbar";
	}
	

	//회원 활동 내역 조회 
	@RequestMapping("/myProfile.do")
	public String myProfile(@ModelAttribute QstnPagingVO vo, 
					@RequestParam(defaultValue = "0") int type,
					HttpSession session, Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("회원 활동 내역 조회, userNo={}", userNo);
		
		vo.setUserNo(userNo);
		int qstnCnt=0, cmntCnt=0, tempCnt=0, bookMarkCnt=0;
		if(type==1) {
			vo.setQuestionImmsave(2);
			qstnCnt=qstnService.getTotalRecord(vo);
			model.addAttribute("qstnCnt", qstnCnt);
			logger.info("회원 활동 내역 - 총 질문 수, qstnCnt={}", qstnCnt);
		}else if(type==2){
			cmntCnt=comntService.getTotalUserCmt(vo);
			logger.info("회원 활동 내역 - 총 답변 개수, cmntCnt={}", cmntCnt);
			model.addAttribute("cmntCnt", cmntCnt);
		}else if(type==3) {
			vo.setQuestionImmsave(1);
			tempCnt=qstnService.getTotalRecord(vo);
			logger.info("회원 활동 내역 - 총 임시저장 글 개수, tempCnt={}", tempCnt);
			model.addAttribute("tempCnt", tempCnt);
		}else if(type==4) {
			bookMarkCnt=qstnService.getBookMarkCnt(vo);
			logger.info("회원 활동 내역 - 총 임시저장 글 개수, bookMarkCnt={}", bookMarkCnt);
			model.addAttribute("bookMarkCnt", bookMarkCnt);
		}
		
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
		
		List<Map<String, Object>> list=null;
		if(type==1) {
			list=qstnService.selectAllQuestion(vo);
			logger.info("활동 내역 조회 결과 - 질문, list.size={}", list.size());
			totalRecord=qstnCnt;
		}else if(type==2) {
			list=comntService.userCmntSelect(vo);
			logger.info("활동 내역 조회 결과 - 답변, list.size={}", list.size());
			totalRecord=cmntCnt;
		}else if(type==3) {
			vo.setQuestionImmsave(1);
			list=qstnService.selectAllQuestion(vo);
			int tempSave=vo.getQuestionImmsave();
			logger.info("활동 내역 조회 결과 - 임시저장, list.size={}, tempSave={}", list.size(), tempSave);
			totalRecord=tempCnt;
		}else if(type==4) {
			list=qstnService.selectBookMarkByUser(vo);
			logger.info("활동 내역 조회 결과 - 북마크, list.size={}, bookMarkCnt={}", list.size(), bookMarkCnt);
			totalRecord=bookMarkCnt;
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
		model.addAttribute("type", type);
		
		logger.info("type={}",type);
		logger.info("list.size={}",list.size());
		
		model.addAttribute("list", list);
		
		
		return "indiv/community/myProfile";
		
	}
	
	
	//회원 질문 조회
	@RequestMapping("/myQstn.do")
	public String userQstnList(@ModelAttribute QstnPagingVO vo,
				HttpSession session, Model model) {
		int userNo=(Integer)session.getAttribute("userNo");
		vo.setUserNo(userNo);
		vo.setQuestionImmsave(2);
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
		
		
		List<Map<String, Object>> popQstnList=qstnService.selectPopularQstn(userNo);
		logger.info("인기 있는 질문 조회, 결과 popQstnList.size={}",popQstnList.size());
		
		
		model.addAttribute("qstnList", qstnList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("popQstnList", popQstnList);
		
		return "indiv/community/myQstn";
	}
	
	//전체 질문 조회
	@RequestMapping("/qstnList.do")
	public String qstnList(@ModelAttribute QstnPagingVO vo, HttpSession session,  Model model) {
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
		
		List<BookmarkVO> bookmarkList =null;
		if(session.getAttribute("userNo")!=null) {
			int userNo=(Integer) session.getAttribute("userNo");
			bookmarkList = qstnService.selectBookmark(userNo);
			logger.info("북마크 한 글 조회 결과, bookmarkList.size={}", bookmarkList.size());
		}
		
		
		model.addAttribute("bookmarkList", bookmarkList);

		model.addAttribute("qstnList", qstnList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "indiv/community/qstnList";
	}
	
	//답변하기 게시판 질문 목록 조회
	@RequestMapping("/answerList.do")
	public String answerList(@RequestParam(defaultValue = "0") int type,
				@ModelAttribute QstnPagingVO vo,
				HttpSession session, Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("질문 전체 조회, 파라미터 vo={}", vo);
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		int totalRecordByWorkkind=qstnService.getTotalRecordByWorkkind(vo);
		logger.info("총 레코드 수, totalRecordByWorkkind={}", totalRecordByWorkkind);
		pagingInfo.setTotalRecord(totalRecordByWorkkind);
		
		List<Map<String, Object>> list=null;
		if(type==1) {
			list=qstnService.selectQstnByWorkkind(vo);
			logger.info("답변하기 질문 조회-최신순, list.size={}", list.size());
		}else if(type==2) {
			list=qstnService.selectQstnByRecmd(vo);
			logger.info("답변하기 질문 조회-추천순, list.size={}", list.size());
		}else if(type==3) {
			list=qstnService.selectQstnByCmntCnt(vo);
			logger.info("답변하기 질문 조회-답변적은순, list.size={}", list.size());			
		}
		
		List<Map<String, Object>> popQstnList=qstnService.selectPopularAllQstn();
		logger.info("답변하기 - 인기 있는 질문 조회 결과, popQstnList.size={}", popQstnList.size());
		model.addAttribute("qstnListByWorkkind", list);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("popQstnList", popQstnList);
		
		return "indiv/community/answerList";
	}
	
	//질문 상세페이지
	@RequestMapping("/qstnDetail.do")
	public String qstnDetail(@RequestParam(defaultValue = "0") int qstnNo, 
			HttpSession session, Model model) {
		
		logger.info("질문 상세 페이지, 파라미터 qstnNo={}", qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnList.do");
			
			return "common/message";
		}
		
		
		/*
		 * QuestionVO qstnVo = qstnService.selectQstn(qstnNo);
		 */		
		Map<String, Object> qstnMap = qstnService.selectQstn(qstnNo);
		int writerNo=Integer.parseInt(String.valueOf(qstnMap.get("USER_NO")));
		String userId=qstnService.selectUserId(writerNo);
		
		logger.info("질문 조회 결과, qstnMap={}",qstnMap);
		if(session.getAttribute("userNo")!=null) {
			int userNo=(Integer) session.getAttribute("userNo");
			BookmarkVO bmVo = new BookmarkVO(); 
			bmVo.setQuestionNo(qstnNo);
			bmVo.setUserNo(userNo);
			int bmStatus=qstnService.DupChkBookmark(bmVo);
			logger.info("북마크 상태 조회, bmStatus={}", bmStatus);
			model.addAttribute("bmStatus", bmStatus);
		}
		
		
		Timestamp regdate = (Timestamp) qstnMap.get("QUESTION_DATE");
		long regTime=regdate.getTime();
		long curTime=System.currentTimeMillis();
		long diffTime = (curTime-regTime)/1000;
		
		int sec = 60;
		int min = 60;
		int hour = 24;

		logger.info("diffTime={}", diffTime);
		String time="";
		if(diffTime<sec) {
			time = "방금 전 작성";
			logger.info("time={}", time);
		}else if((diffTime/=sec)<min) {
			time = diffTime+"분 전 작성";
			logger.info("time={}", time);
			
		}else if((diffTime/=min)<hour) {
			time = diffTime+"시간 전 작성";
		}else {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			time = sdf.format(regdate);
		}
		
		model.addAttribute("time", time);
		model.addAttribute("qstnMap", qstnMap);
		model.addAttribute("userId", userId);
		
		return "indiv/community/qstnDetail";
	}
	

	//질문 등록 화면
	@RequestMapping(value="/qstnWrite.do", method = RequestMethod.GET)
	public String qstnWrite_get(HttpSession session, Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("질문 등록 화면, 파라미터 userNo={}", userNo);
		
		WorkkindVO workkindVo=qstnService.selectUserWorkkind(userNo);
		logger.info("회원 직무 조회 결과, workkindVo={}", workkindVo);
		
		model.addAttribute("workkindVo", workkindVo);
		
		return "indiv/community/qstnWrite";
		
	}


	//질문 등록 처리
	@RequestMapping(value = "/qstnWrite.do", method = RequestMethod.POST)
	public String qstnWrite_post(@ModelAttribute QuestionVO vo, HttpSession session, 
			Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("질문 등록, 파라미터 vo={}", vo);
		vo.setQuestionImmsave(2);
		
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
	
	//임시저장
	@RequestMapping(value="/tempQstn.do", method=RequestMethod.POST)
	public String temp_qstn(@ModelAttribute QuestionVO vo, Model model) {
		vo.setQuestionImmsave(1);
		logger.info("질문 임시 저장, 파라미터 vo={}, tempSave",vo);
		
		int cnt=qstnService.insertQstn(vo);
		logger.info("질문 임시 저장 결과, cnt={}", cnt);
		String msg="임시저장에 실패하였습니다, 다시 시도해주세요.",
				url="/indiv/community/qstnWrite.do";
		if(cnt>0) {
			msg="임시저장 되었습니다.";
			url="/indiv/community/myProfile.do?userNo="+vo.getUserNo()+"&type=3";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	//임시저장 update
	@RequestMapping(value="/updateTemp.do", method=RequestMethod.POST)
	public String tempQstn_Update(@ModelAttribute QuestionVO vo, Model model) {
		vo.setQuestionImmsave(1);
		logger.info("수정 페이지 - 질문 임시 저장, 파라미터 vo={}, tempSave",vo);
		
		int cnt=qstnService.updateTempQstn(vo);
		logger.info("수정 페이지 - 질문 임시 저장 결과, cnt={}", cnt);
		String msg="임시저장에 실패하였습니다, 다시 시도해주세요.",
				url="/indiv/community/qstnEdit.do?qstnNo="+vo.getQuestionNo();
		if(cnt>0) {
			msg="임시저장 되었습니다.";
			url="/indiv/community/myProfile.do?userNo="+vo.getUserNo()+"&type=3";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
	
	//질문 수정 화면
	@RequestMapping(value="/qstnEdit.do", method = RequestMethod.GET)
	public String qstnEdit_get(@RequestParam(defaultValue = "0") int qstnNo,
			HttpSession session, Model model) {
		logger.info("질문 수정 화면, 파라미터 qstnNo={}", qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnDetail.do?qstnNo="+qstnNo);
			
			return "common/message";
		}
		
		int userNo=(Integer) session.getAttribute("userNo");
		WorkkindVO workkindVo=qstnService.selectUserWorkkind(userNo);
		logger.info("회원 직무 조회 결과, workkindVo={}", workkindVo);
		
		/* QuestionVO qstnVo = qstnService.selectQstn(qstnNo); */
		
		Map<String, Object> qstnMap = qstnService.selectQstn(qstnNo);
		logger.info("질문 조회 결과, qstnVo={}",qstnMap);
		
		model.addAttribute("workkindVo", workkindVo);
		model.addAttribute("qstnMap", qstnMap);
		
		return "indiv/community/qstnEdit";
	}
	
	//질문 수정 처리
	@RequestMapping(value="/qstnEdit.do", method = RequestMethod.POST)
	public String qstnEdit_post(@RequestParam int type, @ModelAttribute QuestionVO vo, HttpSession session,
			Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("질문 수정 처리, 파라미터 vo={}", vo);
		
		int cnt=qstnService.updateQstn(vo);
		logger.info("질문 수정 결과, cnt={}", cnt);
		String msg="질문 수정에 실패하였습니다. 다시 입력해주세요",
				url ="/indiv/community/qstnEdit.do?qstnNo="+vo.getQuestionNo();
		if(cnt>0) {
			if(type==1) {
				msg="질문이 수정되었습니다.";
				url="/indiv/community/qstnDetail.do?qstnNo="+vo.getQuestionNo();
			}else if(type==2) {
				msg="질문이 등록되었습니다.";
				url="/indiv/community/qstnList.do";
			}
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
			return "common/message";
		}
		
		int cnt=qstnService.deleteQstn(qstnNo);
		logger.info("질문 삭제 결과, cnt={}", cnt);
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

	//조회수 증가
	@RequestMapping("/cntUpdate.do")
	public String updateReadCount(@RequestParam(defaultValue = "0") int qstnNo, Model model) {
		logger.info("조회수 증가, 파라미터 qstnNo={}", qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/indiv/community/qstnList.do");
			
			return "common/message";
		}
		
		int cnt=qstnService.updateReadCnt(qstnNo);
		logger.info("조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/indiv/community/qstnDetail.do?qstnNo="+qstnNo;
	}
	
	//답변 등록
	@RequestMapping("/cmtWrite.do")
	public String cmtWrite(@ModelAttribute CommentRespondVO vo, 
			@RequestParam(defaultValue = "0")int qstnNo, HttpSession session, 
			Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("답변 등록, 파라미터 vo={}, qstnNo={}", vo, qstnNo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnDetail.do?qstnNo="+qstnNo);
		}
		vo.setUserNo(userNo);
		vo.setQuestionNo(qstnNo);
		
		int cnt=comntService.insertComnt(vo);
		logger.info("답변 등록 결과, cnt={}", cnt);
		String msg="답변 등록에 실패하였습니다. \\n다시 입력해주세요",
				url="/indiv/community/qstnDetail.do?qstnNo="+qstnNo;
		if(cnt>0) {
			int cmtupdateCnt = qstnService.updateComntCnt(qstnNo);
			if(cmtupdateCnt>0) {
				logger.info("답변수 update 결과, cmtupdateCnt={}", cmtupdateCnt);
			}
			msg="답변이 등록되었습니다.";
			url="/indiv/community/qstnDetail.do?qstnNo="+qstnNo;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
	
		return "common/message";
	}
	
	//답변 조회 - 페이징처리
	@RequestMapping("/comments.do")
	public String cmtDetail(@ModelAttribute QstnPagingVO vo,
			@RequestParam int qstnNo, Model model) {
		logger.info("답변 조회, 파라미터 qstnNo={}, vo={}", qstnNo, vo);
		if(qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnDetail.do?qstnNo="+qstnNo);
		}
		
		//[1]pagingInfo
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setCurrentPage(vo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);
		
		//[2]searchVo
		vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		vo.setRecordCountPerPage(Utility.RECORD_COUNT);
		vo.setQuestionNo(qstnNo);
		
		int totalRecord=comntService.getTotalCmt(vo);
		logger.info("총 답변 개수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<Map<String, Object>> cmtList = comntService.selectAllComnt(vo);
		logger.info("답변 조회 결과, cmtList.size={}", cmtList.size());
		
		
		
		model.addAttribute("cmtList", cmtList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "indiv/community/comments";
		
	}
	
	//답변 삭제
	@RequestMapping("/cmtDelete.do")
	public String cmtDelete(@RequestParam(defaultValue = "0") int cmtNo, 
			@RequestParam(defaultValue = "0") int qstnNo, Model model) {
		logger.info("답변 삭제, 파라미터 cmtNo={}, qstnNo={}", cmtNo, qstnNo);
		if(cmtNo==0 || qstnNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/indiv/community/qstnDetail.do?qstnNo="+qstnNo);
		}
		
		int cnt=comntService.deleteCmt(cmtNo);
		logger.info("답변 삭제 결과, cnt={}", cnt);
		String msg="답변 삭제에 실패하였습니다.",
				url ="/indiv/community/qstnDetail.do?qstnNo="+qstnNo;
		if(cnt>0) {
			int cmtUpdateCnt=qstnService.delComntCnt(qstnNo);
			if(cmtUpdateCnt>0) {
				logger.info("답변수 감소 결과, cmtUpdateCnt={}", cmtUpdateCnt);
			}
			msg="답변이 삭제되었습니다.";
			url ="/indiv/community/qstnDetail.do?qstnNo="+qstnNo;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//북마크 등록
	@RequestMapping("/insertBookMark.do")
	public String insertBookMark(@RequestParam(defaultValue = "0")int qstnNo, 
				HttpSession session,HttpServletRequest request, Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("질문 북마크 등록, 파라미터 qstnNo={}, userNo={}",qstnNo, userNo);
		BookmarkVO vo = new BookmarkVO();
		vo.setUserNo(userNo);
		vo.setQuestionNo(qstnNo);
		
		int cnt=qstnService.insertBookMark(vo);
		logger.info("질문 북마크 등록 결과, cnt={}",cnt);
		
		//이전 페이지로 이동
		String referer=request.getHeader("referer");
		return "redirect:"+referer;
		
	}
	
	//북마크 삭제
	@RequestMapping("/delBookMark.do")
	public String delBookMark(@RequestParam(defaultValue = "0")int qstnNo, 
			HttpServletRequest request, HttpSession session, Model model) {
		int userNo=(Integer) session.getAttribute("userNo");
		logger.info("질문 북마크 삭제, 파라미터 qstnNo={}, userNo={}",qstnNo, userNo);
		BookmarkVO vo = new BookmarkVO();
		vo.setUserNo(userNo);
		vo.setQuestionNo(qstnNo);
		
		int cnt=qstnService.delBookmark(vo);
		logger.info("질문 북마크 등록 결과, cnt={}",cnt);
		
		//이전 페이지로 이동
		String referer=request.getHeader("referer");
		return "redirect:"+referer;
	}
	
	/*
	 * //답변 좋아요
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("/likeComment.do") public int
	 * likeComment(@RequestParam(defaultValue = "0") int cmtNo) {
	 * logger.info("답변 좋아요, 파라미터 cmtNo={}", cmtNo);
	 * 
	 * int cnt = comntService.updateLike(cmtNo); logger.info("답변 좋아요 결과, cnt={}",
	 * cnt);
	 * 
	 * int likeNum=0; if(cnt>0) { likeNum = comntService.selectLikeNum(cmtNo);
	 * logger.info("답변 좋아요 개수, likeNum={}", likeNum); } return likeNum;
	 * 
	 * 
	 * }
	 */
	//답변 좋아요
	@RequestMapping("/commentLike.do")
	public String commentLike(@RequestParam(defaultValue = "0") int cmtNo,
			HttpServletRequest request) {
		logger.info("답변 좋아요, 파라미터 cmtNo={}", cmtNo);
		
		int cnt = comntService.updateLike(cmtNo);
		logger.info("답변 좋아요 결과, cnt={}", cnt);
		
		String referer=request.getHeader("referer");
		return "redirect:"+referer;
	}
	
	
	
	
	//댓글 조회
	@ResponseBody
	@RequestMapping("/replyList.do")
	public List<Map<String, Object>> selectReply(@RequestParam(defaultValue = "0") int cmtNo,
						Model model) {
		logger.info("댓글 조회, 파라미터 cmntNo={}", cmtNo);
		List<Map<String, Object>> replyList=replyService.selectComment(cmtNo);
		logger.info("댓글 조회 결과, replyList.size={}", replyList.size());
		
		return replyList;
	}
	
	//댓글 등록 
	@ResponseBody
	@RequestMapping(value="/replyWrite.do",produces="text/plain;charset=UTF-8")
	public int replyWrite(@ModelAttribute CommentsVO vo,HttpSession session) {
		int userNo=(Integer) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("댓글 등록, 파라미터 vo={}", vo);
		
		int cnt=replyService.insertReply(vo);
		logger.info("댓글 등록 결과, cnt={}", cnt);
		return cnt;
	}
	
	
	//댓글 수정
	@ResponseBody
	@RequestMapping("/replyEdit.do")
    public int replyEdit(@ModelAttribute CommentsVO vo,HttpSession session) {
		int userNo=(Integer) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("댓글 수정, 파라미터 vo={}", vo);
		
		int cnt=replyService.updateReply(vo);
		logger.info("댓글 수정 결과, cnt={}, vo={}", cnt, vo);
		
		return cnt;
    }
	
	//댓글 삭제
	@ResponseBody
	@RequestMapping("/replyDelete.do")
	public int replyDel(@RequestParam int replyNo) {
		logger.info("댓글 삭제, 파라미터 replyNo={}", replyNo);
		
		int cnt=replyService.deleteReply(replyNo);
		logger.info("댓글 삭제 결과, cnt={}", cnt);
		
		return cnt;
		
	}
	
	//답변 조회
	@ResponseBody
	@RequestMapping(value="/editComment.do",produces = "application/text; charset=UTF-8")
	public String commentEdit(@RequestParam(defaultValue = "0") int commentNo) {
		logger.info("답변 수정 조회, 파라미터 commentNo={}", commentNo);
		Map<String, Object> commentVo=comntService.selectCommentAbout(commentNo);
		logger.info("답변 수정 조회 결과 , commentVo={}",commentVo);
		String commentAbout=(String) commentVo.get("commentAbout");
		logger.info("commentAbout={}", commentAbout);
		
		return commentAbout;
	}
	
	//답변 수정
	@ResponseBody
	@RequestMapping(value="/updateComment.do", produces = "application/json; charset=UTF-8")
	public int updateComment(@RequestParam(defaultValue = "0") int commentNo,
			@RequestParam String commentAbout) {
		logger.info("답변 글 수정 처리, 파라미터 commentNo={}, commentAbout={}", commentNo, commentAbout);
		CommentRespondVO vo = new CommentRespondVO();
		vo.setCommentrespondAbout(commentAbout);
		vo.setCommentrespondNo(commentNo);
		int cnt = comntService.updateComment(vo);
		logger.info("답변 글 수정 결과 , cnt={}", cnt);
		
		return cnt;
	}
	
	//답변 채택
	@RequestMapping("/adoptComment.do")
	public String adoptComment(@RequestParam(defaultValue = "0") int qstnNo,
			@RequestParam(defaultValue = "0") int commentrespondNo, 
			@RequestParam String messageContent, HttpServletRequest request,
			HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		MessageVO messageVo = new MessageVO();
		messageVo.setUserNo(userNo);
		messageVo.setMessageContent(messageContent);
		logger.info("답변 채택, 파라미터 commentrespondNo={}, messageContent={}", commentrespondNo, messageContent);
		String referer=request.getHeader("referer");
		//쪽지 보내기
		int cnt = comntService.sendAdoptMsg(messageVo);
		logger.info("답변 메시지 전달 결과(send), cnt={}",cnt);
		String msg="답변 채택 메세지가 전달되지 못했습니다.\\n다시 시도해주세요.", 
				url=referer;
		if(cnt>0) {
			
			int answerer = comntService.selectAnswerer(commentrespondNo);
			GetMessageVO getMessageVo = new GetMessageVO();
			getMessageVo.setMessageNo(messageVo.getMessageNo());
			getMessageVo.setUserNo(answerer);
			
			int getMessageCnt = comntService.getAdoptMsg(getMessageVo);
			int adoptRes = comntService.updateCommentLike(commentrespondNo);
			logger.info("답변 채택 & 메시지 전달 결과(get), getMessageCnt={}, adoptRes={}", getMessageCnt,adoptRes);
			if(getMessageCnt>0) {
				msg="답변 채택 메세지가 전달되었습니다.\\n전달한 메세지는 [보낸 쪽지함]에서 확인 가능합니다.";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		//쪽지 보내기 성공 => 쪽지 보낸 시퀀스로 쪽지 받기 
		//답변 채택하기
		
		
	}
}
