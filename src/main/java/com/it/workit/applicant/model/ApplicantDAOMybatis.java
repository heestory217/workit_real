package com.it.workit.applicant.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Repository
public class ApplicantDAOMybatis implements ApplicantDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.applicant.";

	@Override
	public ApplicantlistVO selectByUserNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectByUserNo",userNo);
	}

	@Override
	public int selectApplyCountByUserNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectApplyCountByUserNo",userNo);
	}

	@Override
	public int selectPassCountByUserNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectPassCountByUserNo",userNo);
	}

	@Override
	public int selectFailCountByUserNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectFailCountByUserNo",userNo);
	}

	@Override
	public List<ApplicantlistVO> selectApplyAllByUserNo(IndivpagingVO vo) {
		return sqlSession.selectList(namespace+"selectApplyAllByUserNo",vo);
	}

	@Override
	public List<ApplicantlistVO> selectPassAllByUserNo(IndivpagingVO vo) {
		return sqlSession.selectList(namespace+"selectPassAllByUserNo",vo);
	}

	@Override
	public List<ApplicantlistVO> selectFailAllByUserNo(IndivpagingVO vo) {
		return sqlSession.selectList(namespace+"selectFailAllByUserNo",vo);
	}
}
