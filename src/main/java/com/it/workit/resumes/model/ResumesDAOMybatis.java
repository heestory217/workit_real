package com.it.workit.resumes.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ResumesDAOMybatis implements ResumesDAO{
	@Autowired private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.resumes.";
	@Override
	public ResumesAllVO searchResumeByNo(int resumeNo) {
		return sqlSession.selectOne(namespace+"searchResumeByNo", resumeNo);
	}
	@Override
	public int insertAward(AwardVO aVo) {
		return sqlSession.insert(namespace+"insertAward", aVo);
	}
	@Override
	public int insertResume(ResumesVO resumeVo) {
		return sqlSession.insert(namespace+"insertResume",resumeVo);
	}
	@Override
	public int insertCarrer(CarrerVO carrVo) {
		return sqlSession.insert(namespace+"insertCarrer",carrVo);
	}
	@Override
	public int insertLicen(LicencseVO licenVo) {
		return sqlSession.insert(namespace+"insertLicen",licenVo);
	}
	@Override
	public int insertForeignskill(ForeignlanguageskillVO foreignVo) {
		return sqlSession.insert(namespace+"insertForeignskill",foreignVo);
	}
	@Override
	public List<ResumesVO> selectResumeByNo(int userNo) {
		return sqlSession.selectList(namespace+"selectResumeByNo", userNo);
	}
	
	//select
	@Override
	public Map<String, Object> selectByRsUser(int resumeNo) {
		return sqlSession.selectOne(namespace+"selectByRsUser",resumeNo);
	}
	@Override
	public List<AwardVO> selectAwdByNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectAwdByNo",resumeNo);
	}
	@Override
	public List<LicencseVO> selectLicenByNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectLicenByNo",resumeNo);
	}
	@Override
	public List<CarrerVO> selectCarByNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectCarByNo",resumeNo);
	}
	@Override
	public List<ForeignlanguageskillVO> selectFlsByNo(int resumeNo) {
		return sqlSession.selectList(namespace+"selectFlsByNo",resumeNo);
	}
	
	
}
