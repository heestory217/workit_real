package com.it.workit.question.model;

public interface QuestionDAO {
	int insertQstn(QuestionVO vo);
	QuestionVO selectQstn(int qstnNo);
	int updateQstn(QuestionVO vo);
}
