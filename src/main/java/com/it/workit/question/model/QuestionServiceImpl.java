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
	
	//질문 등록
	@Override
	public int insertQstn(QuestionVO vo) {
		return questionDao.insertQstn(vo);
	}
	
	//질문 조회
	@Override
	public QuestionVO selectQstn(int qstnNo) {
		return questionDao.selectQstn(qstnNo);
	}
	
	//질문 수정
	@Override
	public int updateQstn(QuestionVO vo) {
		return questionDao.updateQstn(vo);
	}
	
	//전체 질문 조회
	@Override
	public List<QuestionVO> selectAllQstn() {
		return questionDao.selectAllQstn();
	}


	@Override
	public int selectUserQstnCnt(int userNo) {
		return questionDao.selectUserQstnCnt(userNo);
	}

	//질문 삭제
	@Override
	public int deleteQstn(int qstnNo) {
		return questionDao.deleteQstn(qstnNo);
	}

	@Override
	public int getTotalRecord(QstnPagingVO vo) {
		return questionDao.getTotalRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllQuestion(QstnPagingVO vo) {
		return questionDao.selectAllQuestion(vo);
	}


	
}
