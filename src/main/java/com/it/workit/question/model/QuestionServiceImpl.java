package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QuestionServiceImpl implements QuestionService{
	@Autowired private QuestionDAO questionDao;

	//회원 질문 목록 조회
	@Override
	public List<Map<String, Object>> selectUserQstnAll(int userNo) {
		return questionDao.selectUserQstnAll(userNo);
	}
	
	//질문 등록
	@Override
	public int insertQstn(QuestionVO vo) {
		return questionDao.insertQstn(vo);
	}
	
	//질문 조회
	@Override
	public QuestionVO selectQstn(int qstnNo) {
		return questionDao.selectQstn(qstnNo);
	}
	
	//질문 수정
	@Override
	public int updateQstn(QuestionVO vo) {
		return questionDao.updateQstn(vo);
	}
	
	//전체 질문 조회
	@Override
	public List<QuestionVO> selectAllQstn() {
		return questionDao.selectAllQstn();
	}

	//질문 삭제
	@Override
	public int deleteQstn(int qstnNo) {
		return questionDao.deleteQstn(qstnNo);
	}

	@Override
	public int getTotalRecord(QstnPagingVO vo) {
		return questionDao.getTotalRecord(vo);
	}

	@Override
	public List<Map<String, Object>> selectAllQuestion(QstnPagingVO vo) {
		return questionDao.selectAllQuestion(vo);
	}

	@Override
	public int updateReadCnt(int qstnNo) {
		return questionDao.updateReadCnt(qstnNo);
	}
	
	//회원 직무 조회
	@Override
	public WorkkindVO selectUserWorkkind(int userNo) {
		return questionDao.selectUserWorkkind(userNo);
	}
	
	//인기 있는 질문 조회(나의질문)
	@Override
	public List<Map<String, Object>> selectPopularQstn(int userNo) {
		return questionDao.selectPopularQstn(userNo);
	}
	
	//답변하기 게시판 질문 조회
	@Override
	public List<Map<String, Object>> selectQstnByWorkkind(QstnPagingVO vo) {
		return questionDao.selectQstnByWorkkind(vo);
	}
	
	//답변하게 게시판 질문 총개수
	@Override
	public int getTotalRecordByWorkkind(QstnPagingVO vo) {
		return questionDao.getTotalRecordByWorkkind(vo);
	}

	//답변하기 게시판 질문 조회(추천순)
	@Override
	public List<Map<String, Object>> selectQstnByRecmd(QstnPagingVO vo) {
		return questionDao.selectQstnByRecmd(vo);
	}

	//답변하기 게시판 질문 조회(답변적은순)
	@Override
	public List<Map<String, Object>> selectQstnByCmntCnt(QstnPagingVO vo) {
		return questionDao.selectQstnByCmntCnt(vo);
	}
	
	//질문번호에 해당하는 답변수
	@Override
	public int getTotalCmtCntByQstnNo(int qstnNo) {
		return questionDao.getTotalCmtCntByQstnNo(qstnNo);
	}
	
	//인기 있는 질문 전체 조회
	@Override
	public List<Map<String, Object>> selectPopularAllQstn() {
		return questionDao.selectPopularAllQstn();
	}
	
	//북마크 등록
	@Override
	public int insertBookMark(BookmarkVO vo) {
		return questionDao.insertBookMark(vo);
	}
	
	//북마크 상태 체크
	@Override
	public int DupChkBookmark(BookmarkVO vo) {
		return questionDao.DupChkBookmark(vo);
	}
	
	//북마크 삭제
	@Override
	public int delBookmark(BookmarkVO vo) {
		return questionDao.delBookmark(vo);
	}
	
	//회원 북마크 조회
	@Override
	public List<Map<String, Object>> selectBookMarkByUser(QstnPagingVO vo) {
		return questionDao.selectBookMarkByUser(vo);
	}
	
	//회원 북마크 개수
	@Override
	public int getBookMarkCnt(QstnPagingVO vo) {
		return questionDao.getBookMarkCnt(vo);
	}
	
	//질문 수정(임시저장)
	@Override
	public int updateTempQstn(QuestionVO vo) {
		return questionDao.updateTempQstn(vo);
	}

	//답변이 등록되면 답변 개수가 증가됨
	@Override
	public int updateComntCnt(int qstnNo) {
		return questionDao.updateComntCnt(qstnNo);
	}

	//답변이 삭제되면 답변 개수가 감소됨
	@Override
	public int delComntCnt(int qstnNo) {
		return questionDao.delComntCnt(qstnNo);
	}


	
}
