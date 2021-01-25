package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

public interface QuestionDAO {
	List<Map<String, Object>> selectUserQstnAll(int userNo);
	
	int insertQstn(QuestionVO vo);	//질문 등록
	QuestionVO selectQstn(int qstnNo);	//질문 상세 조회
	int updateQstn(QuestionVO vo);	//질문 수정
	List<QuestionVO> selectAllQstn();	
	int deleteQstn(int qstnNo);		//질문 삭제				
	int getTotalRecord(QstnPagingVO vo);	//총 레코드수
	List<Map<String, Object>> selectAllQuestion(QstnPagingVO vo);	//질문 목록 조회(전체,회원)
	int updateReadCnt(int qstnNo);		//조회수 증가
}
