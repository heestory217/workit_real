package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import com.it.workit.question.model.QstnPagingVO;

public interface CommentRespondService {
	int insertComnt(CommentRespondVO vo);	//답변 등록
	List<Map<String, Object>> selectAllComnt(QstnPagingVO vo);	//답변 조회
	int getTotalCmt(QstnPagingVO vo);	//답변 개수
}
