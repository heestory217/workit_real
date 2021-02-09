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
//	public int updateAwd(List<AwardVO> aList);
//	public int updateCarrer(List<CarrerVO> cList);
//	public int updateLicen(List<LicencseVO> lList);
//	public int updateFskill(List<ForeignlanguageskillVO> fList);
	
	//선택 삭제
	public int selDelAwd(int awardNo);
	public int selDelCarrer(int carrerNo);
	public int selDelLicen(int licencseNo);
	public int selDelFskill(int foreignlanguageskillNo);

}
