package com.it.workit.comments.model;

import java.util.List;
import java.util.Map;

public interface CommentsDAO {
	int insertReply(CommentsVO vo);	//답변 등록
	List<Map<String, Object>> selectComment(int cmntNo);	//답변 조회
	int updateReply(CommentsVO vo);	//댓글 수정
	int deleteReply(int replyNo);	//댓글 삭제
	int selectReplyCnt(int commentNo);	//댓글 개수
}
