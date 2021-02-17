package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import com.it.workit.getmessage.model.GetMessageVO;
import com.it.workit.message.model.MessageVO;
import com.it.workit.question.model.QstnPagingVO;

public interface CommentRespondDAO {
	int insertComnt(CommentRespondVO vo);	//답변 등록
	List<Map<String, Object>> selectAllComnt(QstnPagingVO vo);	//답변 조회
	int getTotalCmt(QstnPagingVO vo);	//답변 개수
	int deleteCmt(int cmtNo);	//답변 삭제
	List<Map<String, Object>> userCmntSelect(QstnPagingVO vo);	//회원 답변 조회
	int getTotalUserCmt(QstnPagingVO vo);	//회원 답변 개수
	int updateLike(int cmtNo);	//답변 좋아요
	int selectLikeNum(int cmtNo);	//답변 좋아요 개수 조회
	Map<String, Object> selectCommentAbout(int commentNo);	//답변 글 조회
	int updateComment(CommentRespondVO vo);	//답변 글 수정
	
	int sendAdoptMsg(MessageVO vo);	//답변 채택 메세지 보내기
	int selectAnswerer(int commentsNo);//답변 글쓴 회원 조회
	int getAdoptMsg(GetMessageVO vo);	//답변 채택 메세지 받기
	int updateCommentLike(int commentsNo);	//답변 채택
}
