package com.it.workit.admin.notice.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;

@Repository
public class NoticeDAOMybatis implements NoticeDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="com.mybatis.mapper.notice.";
	
	//공지사항 카테고리 조회
	@Override
	public List<ClassificationsVO> selectClassifications() {
		return sqlSession.selectList(namespace+"selectClassifications");
	}
	
	//공지사항 전체 조회
	@Override
	public List<Map<String, Object>> selectNoticeAll(NoticeSearchVO vo) {
		return sqlSession.selectList(namespace+"selectNoticeAll", vo);
	}
	
	//공지사항 전체 레코드 수
	@Override
	public int getTotalRecord(NoticeSearchVO vo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", vo);
	}
	
	//공지사항 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		return sqlSession.delete(namespace+"deleteNotice", noticeNo);
	}
	
	//공지사항 등록
	@Override
	public int insertNotice(NoticeVO vo) {
		return sqlSession.insert(namespace+"insertNotice", vo);
	}
	
	//공지사항 조회
	@Override
	public Map<String, Object> selectNoticeByNo(int noticeNo) {
		return sqlSession.selectOne(namespace+"selectNoticeByNo",noticeNo);
	}
	
	//공지사항 수정
	@Override
	public int updateNotice(NoticeVO vo) {
		return sqlSession.update(namespace+"updateNotice", vo);
	}
	
	
}
