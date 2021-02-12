package com.it.workit.review.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.ReviewPageVO;
import com.it.workit.common.SearchVO;
import com.it.workit.common.Utility;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.CorpVO;
import com.it.workit.review.model.ReviewService;
import com.it.workit.review.model.ReviewVO;

@Controller
@RequestMapping("/company/corp")
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired private ReviewService reviewService;
	@Autowired private CorpService corpService;
	
	@RequestMapping("/corpReviewList.do")
	public String corpReviewList(@ModelAttribute ReviewPageVO searchVo, HttpSession session, Model model) {
		logger.info("기업 리뷰보기");
		logger.info("페이지 파라미터 searchvo={}", searchVo);
		if(searchVo.getCorpNo()==0) {
			String msg="잘못된 URL입니다.",url="/index.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(3);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(3);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		List<ReviewVO> list = reviewService.selectReviewList(searchVo);
		logger.info("기업 리뷰 리스트 list.size={}",list.size());
		
		int totalRecord=reviewService.selectTotalRecord(searchVo);
		logger.info("전체 게시글 수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		//유저로 해당 기업인지 , 일반 유저인지(결제 여부) 체크
		int userNo = (Integer)session.getAttribute("userNo");
		int userChk = 0;
		CorpVO corpVo = corpService.selectCorp(searchVo.getCorpNo());
		if(corpVo.getUserNo()==userNo) {
			userChk=1;
		};
		
		//session.getAttribute("seervcheck");
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("reList",list);
		model.addAttribute("userChk",userChk);
		for(ReviewVO vo : list) {
			System.out.println(vo);
		}
		return "company/corp/corpReviewList";
	}
	
}
