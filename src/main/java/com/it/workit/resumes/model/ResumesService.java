package com.it.workit.resumes.model;

import java.util.List;
import java.util.Map;

public interface ResumesService {

	List<ResumesAllVO> searchResumeByNo(List<Integer> matchList);
	
	int insertResume(ResumesVO resumeVo);
	
	int insertResumesMulti(ResumeListVO resumlist);
	
	public List<ResumesVO> selectResumeByNo(int userNo);
	
	public Map<String, Object> selectByRsUser(int resumeNo);
	public List<AwardVO> selectAwdByNo(int resumeNo);
	public List<LicencseVO> selectLicenByNo(int resumeNo);
	public List<CarrerVO> selectCarByNo(int resumeNo);
	public List<ForeignlanguageskillVO> selectFlsByNo(int resumeNo);
	
	public int deleteResumes(int resumeNo);
}
