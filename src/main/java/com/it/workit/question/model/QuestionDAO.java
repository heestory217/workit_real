package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

public interface QuestionDAO {
	int insertQstn(QuestionVO vo);
	QuestionVO selectQstn(int qstnNo);
	int updateQstn(QuestionVO vo);
	List<QuestionVO> selectAllQstn();
	List<Map<String, Object>> selectUserQstnAll(int userNo);
	int selectUserQstnCnt(int userNo);
}
