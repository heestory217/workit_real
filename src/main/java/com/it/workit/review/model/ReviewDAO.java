package com.it.workit.review.model;

import java.util.List;

import com.it.workit.common.ReviewPageVO;

public interface ReviewDAO {
	List<ReviewVO> selectReviewList(ReviewPageVO searchVo);

	int selectTotalRecord(ReviewPageVO searchVo);

}
