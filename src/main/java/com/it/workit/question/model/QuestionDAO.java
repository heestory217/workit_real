package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

public interface QuestionDAO {
	List<Map<String, Object>> selectUserQstnAll(int userNo);
	
	int insertQstn(QuestionVO vo);	//질문 등록
	QuestionVO selectQstn(int qstnNo);	//질문 상세 조회
	int updateQstn(QuestionVO vo);	//질문 수정
	List<QuestionVO> selectAllQstn();	
	int deleteQstn(int qstnNo);		//질문 삭제				
	int getTotalRecord(QstnPagingVO vo);	//총 레코드수
	List<Map<String, Object>> selectAllQuestion(QstnPagingVO vo);	//질문 목록 조회(전체,회원)
	int updateReadCnt(int qstnNo);		//조회수 증가
	WorkkindVO selectUserWorkkind(int userNo); //회원 직무 조회
	List<Map<String, Object>> selectPopularQstn(int userNo);	//인기 있는 질문 조회(나의질문게시판)
	List<Map<String, Object>> selectPopularAllQstn();	//인기 있는 질문 전체 조회
	List<Map<String, Object>> selectQstnByWorkkind(QstnPagingVO vo);	//답변하기 게시판 목록 조회
	List<Map<String, Object>> selectQstnByRecmd(QstnPagingVO vo);	//답변하기 게시판 목록 조회(추천순)
	List<Map<String, Object>> selectQstnByCmntCnt(QstnPagingVO vo);	//답변하기 게시판 목록 조회(답변적은순)
	int getTotalRecordByWorkkind(QstnPagingVO vo);	//답변하기 게시판 질문 총 레코드수
	int getTotalCmtCntByQstnNo(int qstnNo);	//질문에 해당하는 답변수
	int insertBookMark(BookmarkVO vo);	//북마크 등록
	int delBookmark(BookmarkVO vo);	//북마크 삭제
	int DupChkBookmark(BookmarkVO vo);	//북마크 중복 체크
	List<Map<String, Object>> selectBookMarkByUser(QstnPagingVO vo);//회원 북마크 조회
	int getBookMarkCnt(QstnPagingVO vo);	//회원 북마크 개수
	
}
