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
	
	//삭제
	@Override
	public int delResume(int resumeNo) {
		return sqlSession.delete(namespace+"delResume",resumeNo);
	}
	@Override
	public int delAwd(int resumeNo) {
		return sqlSession.delete(namespace+"delAwd",resumeNo);
	}
	@Override
	public int delCarrer(int resumeNo) {
		return sqlSession.delete(namespace+"delCarrer",resumeNo);
	}
	@Override
	public int delLicen(int resumeNo) {
		return sqlSession.delete(namespace+"delLicen",resumeNo);
	}
	@Override
	public int delFskill(int resumeNo) {
		return sqlSession.delete(namespace+"delFskill",resumeNo);
	}
	@Override
	public int delUlang(int resumeNo) {
		return sqlSession.delete(namespace+"delUlang",resumeNo);
	}
	@Override
	public int delUarea(int resumeNo) {
		return sqlSession.delete(namespace+"delUarea",resumeNo);
	}
	
	//수정
	@Override
	public int updateResume(ResumesVO resumeVo) {
		return sqlSession.update(namespace+"updateResume",resumeVo);
	}
	@Override
	public int updateAwd(AwardVO awardVo) {
		return sqlSession.update(namespace+"updateAwd",awardVo);
	}
	@Override
	public int updateCarrer(CarrerVO carrerVo) {
		return sqlSession.update(namespace+"updateCarrer",carrerVo);
	}
	@Override
	public int updateFskill(ForeignlanguageskillVO fskillVo) {
		return sqlSession.update(namespace+"updateFskill",fskillVo);
	}
	@Override
	public int updateLicen(LicencseVO licenVo) {
		return sqlSession.update(namespace+"updateLicen",licenVo);
	}
	
	//선택 삭제
	@Override
	public int selDelAwd(int awardNo) {
		return sqlSession.delete(namespace+"selDelAwd", awardNo);
	}
	@Override
	public int selDelCarrer(int carrerNo) {
		return sqlSession.delete(namespace+"selDelCarrer",carrerNo);
	}
	@Override
	public int selDelLicen(int licencseNo) {
		return sqlSession.delete(namespace+"selDelLicen",licencseNo);
	}
	@Override
	public int selDelFskill(int foreignlanguageskillNo) {
		return sqlSession.delete(namespace+"selDelFskill",foreignlanguageskillNo);
	}
	
	
	@Override
	public int insertUserlang(CorpuselanguageVO userlangVo) {
		return sqlSession.insert(namespace+"insertUserlang",userlangVo);
	}
	@Override
	public List<AreaVO> selectAreaNo(String areaAdd2) {
		return sqlSession.selectList(namespace+"selectAreaNo",areaAdd2);
	}
	@Override
	public int insertUserArea(UserwantedworkareaVO userAreaVo) {
		return sqlSession.insert(namespace+"insertUserArea",userAreaVo);
	}
	//이력서 승인대기로 업데이트
	@Override
	public int resumeOpen(int resumeNo) {
		return sqlSession.update(namespace+"resumeOpen",resumeNo);
	}
	//이력서 임시로 다시 업데이트
	@Override
	public int upadteImsi(int resumeNo) {
		return sqlSession.update(namespace+"upadteImsi",resumeNo);
	}
	
	
	
	
}
