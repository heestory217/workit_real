package com.it.workit.resumes.model;

public interface ResumesDAO {

	ResumesAllVO searchResumeByNo(int resumeNo);
	
	int insertResume(ResumesVO resumeVo);
	
	int insertAward(AwardVO aVo);
	int insertCarrer(CarrerVO carrVo);
	int insertLicen(LicencseVO licenVo);
	int insertForeignskill(ForeignlanguageskillVO foreignVo);
}
