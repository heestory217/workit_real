package com.it.workit.review.model;

import java.util.List;

public interface ReviewDAO {
	List<ReviewVO> selectReviewList(int corpNo);

}
