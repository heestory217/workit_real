package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	List<Map<String, Object>> selectUserQstnAll(int userNo);
	
	int insertQstn(QuestionVO vo);
	QuestionVO selectQstn(int qstnNo);
	int updateQstn(QuestionVO vo);
	List<QuestionVO> selectAllQstn();
	int deleteQstn(int qstnNo);
	int getTotalRecord(QstnPagingVO vo);
	
	List<Map<String, Object>> selectAllQuestion(QstnPagingVO vo);
	int updateReadCnt(int qstnNo);
	
	WorkkindVO selectUserWorkkind(int userNo);	//회원 직무 조회
}
