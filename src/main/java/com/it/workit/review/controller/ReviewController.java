package com.it.workit.review.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.review.model.ReviewService;
import com.it.workit.review.model.ReviewVO;

@Controller
@RequestMapping("/company/corp")
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired private ReviewService reviewService;
	
	@RequestMapping("/corpReviewList.do")
	public String corpReviewList(@RequestParam(defaultValue = "0") int corpNo ,Model model) {
		logger.info("기업 리뷰보기");
		if(corpNo==0) {
			String msg="잘못된 URL입니다.",url="/index.do";
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		List<ReviewVO> list = reviewService.selectReviewList(corpNo);
		logger.info("기업 리뷰 리스트 list.size={}",list.size());
		
		model.addAttribute("reList",list);
		
		return "company/corp/corpReviewList";
	}
	
}
