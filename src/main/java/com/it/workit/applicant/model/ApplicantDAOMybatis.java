package com.it.workit.applicant.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<ApplicantlistVO> selectAllApplicantFromCorp(int userNo) {
		return sqlSession.selectList(namespace+"selectAllApplicantFromCorp", userNo);
	}

	@Override
	public List<Map<String, Object>> selectAllApplicantView(CorpApplicantPagingVO vo) {
		return sqlSession.selectList(namespace+"selectAllApplicantView", vo);
	}

	@Override
	public int updateReadCount(int applicantlistNo) {
		return sqlSession.update(namespace+"updateReadCount", applicantlistNo);
	}

	@Override
	public ApplicantlistVO selectOneApplication(int applicantlistNo) {
		return sqlSession.selectOne(namespace+"selectOneApplication", applicantlistNo);
	}

	@Override
	public int updaeApplyPass(int applicantlistNo) {
		return sqlSession.update(namespace+"updaeApplyPass", applicantlistNo);
	}

	@Override
	public int updaeApplyFail(int applicantlistNo) {
		return sqlSession.update(namespace+"updaeApplyFail", applicantlistNo);
	}

	@Override
	public int selectAllAppliedCount(CorpApplicantPagingVO vo) {
		return sqlSession.selectOne(namespace+"selectAllAppliedCount", vo);
	}

	@Override
	public int selectPassCount(CorpApplicantPagingVO vo) {
		return sqlSession.selectOne(namespace+"selectPassCount", vo);
	}

	@Override
	public int selectFailCount(CorpApplicantPagingVO vo) {
		return sqlSession.selectOne(namespace+"selectFailCount", vo);
	}

	@Override
	public int selectReadCount(CorpApplicantPagingVO vo) {
		return sqlSession.selectOne(namespace+"selectReadCount", vo);
	}

}
