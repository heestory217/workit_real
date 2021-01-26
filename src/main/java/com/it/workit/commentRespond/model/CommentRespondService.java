package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import com.it.workit.question.model.QstnPagingVO;

public interface CommentRespondService {
	int insertComnt(CommentRespondVO vo);	//답변 등록
	List<Map<String, Object>> selectAllComnt(QstnPagingVO vo);	//답변 조회
	int getTotalCmt(QstnPagingVO vo);	//답변 개수
	int deleteCmt(int cmtNo);	//답변 삭제
	List<Map<String, Object>> userCmntSelect(QstnPagingVO vo);	//회원 답변 조회
	int getTotalUserCmt(QstnPagingVO vo);	//회원 답변 개수
}
