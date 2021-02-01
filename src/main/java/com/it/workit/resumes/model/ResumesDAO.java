package com.it.workit.resumes.model;

public interface ResumesDAO {

	ResumesAllVO searchResumeByNo(int resumeNo);
	
	int insertAward(AwardVO aVo);
}
