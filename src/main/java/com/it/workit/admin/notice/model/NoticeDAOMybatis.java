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
	public List<Map<String, Object>> selectNoticeAll(SearchVO vo) {
		return sqlSession.selectList(namespace+"selectNoticeAll", vo);
	}
	
	//공지사항 전체 레코드 수
	@Override
	public int getTotalRecord(SearchVO vo) {
		return sqlSession.selectOne(namespace+"getTotalRecord", vo);
	}
	
	
}
