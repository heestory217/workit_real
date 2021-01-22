package com.it.workit.question.model;

import java.util.List;

public interface QuestionService {
	int insertQstn(QuestionVO vo);
	QuestionVO selectQstn(int qstnNo);
	int updateQstn(QuestionVO vo);
	List<QuestionVO> selectAllQstn();
}
