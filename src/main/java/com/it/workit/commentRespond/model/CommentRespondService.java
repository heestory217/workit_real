package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

public interface CommentRespondService {
	int insertComnt(CommentRespondVO vo);	//답변 등록
	List<Map<String, Object>> selectAllComnt(int qstnNo);	//답변 조회
}
