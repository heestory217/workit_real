package com.it.workit.review.model;

import java.util.List;

import com.it.workit.common.ReviewPageVO;

public interface ReviewService {

	List<ReviewVO> selectReviewList(ReviewPageVO searchVo);

	int selectTotalRecord(ReviewPageVO searchVo);

}
