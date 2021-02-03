package com.it.workit.question.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QuestionDAOMybatis implements QuestionDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.question.";

	//회원 질문 목록 조회
	@Override
	public List<Map<String, Object>> selectUserQstnAll(int userNo) {
		return sqlSession.selectList(namespace+"selectUserQstnAll", userNo);
	}
	
	//질문 등록
	@Override
	public int insertQstn(QuestionVO vo) {
		return sqlSession.insert(namespace+"insertQstn", vo);
	}

	//질문 조회
	@Override
	public QuestionVO selectQstn(int qstnNo) {
		return sqlSession.selectOne(namespace+"selectQstn", qstnNo);
	}
	
	//질문 수정
	@Override
	public int updateQstn(QuestionVO vo) {
		return sqlSession.update(namespace+"updateQstn", vo);
	}
	
	//전체 질문 조회
	@Override
	public List<QuestionVO> selectAllQstn() {
		return sqlSession.selectList(namespace+"selectAllQstn");
	}

	//질문 삭제
	@Override
	public int deleteQstn(int qstnNo) {
		return sqlSession.delete(namespace+"deleteQstn", qstnNo);
	}

	@Override
	public int getTotalRecord(QstnPagingVO vo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", vo);
	}

	@Override
	public List<Map<String, Object>> selectAllQuestion(QstnPagingVO vo) {
		return sqlSession.selectList(namespace+"selectAllQuestion", vo);
	}

	@Override
	public int updateReadCnt(int qstnNo) {
		return sqlSession.update(namespace+"updateReadCnt", qstnNo);
	}

	//회원 직무 조회
	@Override
	public WorkkindVO selectUserWorkkind(int userNo) {
		return sqlSession.selectOne(namespace+"selectUserWorkkind",userNo);
	}
	
	//인기 있는 질문 조회
	@Override
	public List<Map<String, Object>> selectPopularQstn(int userNo) {
		return sqlSession.selectList(namespace+"selectPopularQstn",userNo);
	}
	
	//답변하기 게시판 질문 조회
	@Override
	public List<Map<String, Object>> selectQstnByWorkkind(QstnPagingVO vo) {
		return sqlSession.selectList(namespace+"selectQstnByWorkkind", vo);
	}

	//답변하기 게시판 질문 총 개수
	@Override
	public int getTotalRecordByWorkkind(QstnPagingVO vo) {
		return sqlSession.selectOne(namespace+"getTotalRecordByWorkkind", vo);
	}
	
	
}
