package com.it.workit.review.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired ReviewDAO reDao;

	@Override
	public List<ReviewVO> selectReviewList(int corpNo) {
		return reDao.selectReviewList(corpNo);
	}
}
