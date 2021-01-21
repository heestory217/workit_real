package com.it.workit.review.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.common.ReviewPageVO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired ReviewDAO reDao;

	@Override
	public List<ReviewVO> selectReviewList(ReviewPageVO searchVo) {
		return reDao.selectReviewList(searchVo);
	}

	@Override
	public int selectTotalRecord(ReviewPageVO searchVo) {
		return reDao.selectTotalRecord(searchVo);
	}
}
