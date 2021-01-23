package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, Object>> selectUserQstnAll(String qstnNick) {
		return questionDao.selectUserQstnAll(qstnNick);
	}

	@Override
	public int selectUserQstnCnt(int userNo) {
		return questionDao.selectUserQstnCnt(userNo);
	}

	@Override
	public CmtyuserinfoVO selectUserInfo(int userNo) {
		return questionDao.selectUserInfo(userNo);
	}
	
	
}
