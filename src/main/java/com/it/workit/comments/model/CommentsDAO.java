package com.it.workit.comments.model;

import java.util.List;

public interface CommentsDAO {
	int insertReply(CommentsVO vo);	//답변 등록
	List<CommentsVO> selectComment(int replyNo);	//답변 조회
}
