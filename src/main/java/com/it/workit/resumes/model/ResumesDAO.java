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
	
}
