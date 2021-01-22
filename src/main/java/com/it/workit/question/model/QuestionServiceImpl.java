package com.it.workit.question.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	@Autowired private QuestionDAO questionDao;

	@Override
	public int insertQstn(QuestionVO vo) {
		return questionDao.insertQstn(vo);
	}

	@Override
	public QuestionVO selectQstn(int qstnNo) {
		return questionDao.selectQstn(qstnNo);
	}

	@Override
	public int updateQstn(QuestionVO vo) {
		return questionDao.updateQstn(vo);
	}

	@Override
	public List<QuestionVO> selectAllQstn() {
		return questionDao.selectAllQstn();
	}
	
	
}
