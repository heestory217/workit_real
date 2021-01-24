package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	List<Map<String, Object>> selectUserQstnAll(int userNo);
	
	int insertQstn(QuestionVO vo);
	QuestionVO selectQstn(int qstnNo);
	int updateQstn(QuestionVO vo);
	List<QuestionVO> selectAllQstn();
	int selectUserQstnCnt(int userNo);
	int deleteQstn(int qstnNo);
}
