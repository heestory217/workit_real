package com.it.workit.comments.model;

import java.util.List;
import java.util.Map;

public interface CommentsService {
	int insertReply(CommentsVO vo);	//답변 등록
	List<Map<String, Object>> selectComment(int cmntNo);	//답변 조회
}