package com.it.workit.question.model;

public interface QuestionService {
	int insertQstn(QuestionVO vo);
	QuestionVO selectQstn(int qstnNo);
	int updateQstn(QuestionVO vo);
}
