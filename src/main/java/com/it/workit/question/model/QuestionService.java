package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

public interface QuestionService {
	int insertQstn(QuestionVO vo);
	QuestionVO selectQstn(int qstnNo);
	int updateQstn(QuestionVO vo);
	List<QuestionVO> selectAllQstn();
	List<Map<String, Object>> selectUserQstnAll(String qstnNick);
	int selectUserQstnCnt(int userNo);
	CmtyuserinfoVO selectUserInfo(int userNo);
}
