package com.it.workit.question.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	@Autowired private QuestionDAO questionDao;

	@Override
	public int insertQstn(QuestionVO vo) {
		return questionDao.insertQstn(vo);
	}
	
	
}
