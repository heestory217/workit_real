package com.it.workit.resumes.model;

import java.util.List;

public interface ResumesService {

	List<ResumesAllVO> searchResumeByNo(List<Integer> matchList);
	
	int insertResume(ResumesVO resumeVo);
	
	int insertResumesMulti(ResumeListVO resumlist);
}
