package com.it.workit.resumes.model;

import java.util.List;
import java.util.Map;

public interface ResumesDAO {

	ResumesAllVO searchResumeByNo(int resumeNo);
	
	int insertResume(ResumesVO resumeVo);
	
	int insertAward(AwardVO aVo);
	int insertCarrer(CarrerVO carrVo);
	int insertLicen(LicencseVO licenVo);
	int insertForeignskill(ForeignlanguageskillVO foreignVo);
	
	public List<ResumesVO> selectResumeByNo(int userNo);
	
	public Map<String, Object> selectByRsUser(int resumeNo);
	public List<AwardVO> selectAwdByNo(int resumeNo);
	public List<LicencseVO> selectLicenByNo(int resumeNo);
	public List<CarrerVO> selectCarByNo(int resumeNo);
	public List<ForeignlanguageskillVO> selectFlsByNo(int resumeNo);
	
	public int delResume(int resumeNo);
	public int delAwd(int resumeNo);
	public int delCarrer(int resumeNo);
	public int delLicen(int resumeNo);
	public int delFskill(int resumeNo);
	
	public int updateResume(ResumesVO resumeVo);
	public int updateAwd(AwardVO awardVo);
	public int updateCarrer(CarrerVO carrerVo);
	public int updateFskill(ForeignlanguageskillVO fskillVo);
	public int updateLicen(LicencseVO licenVo);
	
	//선택 삭제
	public int selDelAwd(int awardNo);
	public int selDelCarrer(int carrerNo);
	public int selDelLicen(int licencseNo);
	public int selDelFskill(int foreignlanguageskillNo);

	//언어 인서트
	public int insertUserlang(CorpuselanguageVO userlangVo);
	
	//지역번호 구하기
	public List<AreaVO> selectAreaNo(String areaAdd2);
	
	//지역 인서트
	public int insertUserArea(UserwantedworkareaVO userAreaVo);
	
	//이력서 승인대기로 업데이트
	public int resumeOpen(int resumeNo);
	
}
