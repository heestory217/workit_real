package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	@Autowired private QuestionDAO questionDao;

	//회원 질문 목록 조회
	@Override
	public List<Map<String, Object>> selectUserQstnAll(int userNo) {
		return questionDao.selectUserQstnAll(userNo);
	}
	
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


	@Override
	public int selectUserQstnCnt(int userNo) {
		return questionDao.selectUserQstnCnt(userNo);
	}


	
}
