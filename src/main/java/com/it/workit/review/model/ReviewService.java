package com.it.workit.review.model;

import java.util.List;

public interface ReviewService {

	List<ReviewVO> selectReviewList(int corpNo);

}
