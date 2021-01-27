package com.it.workit.resumes.model;

import java.util.List;

public interface ResumesDAO {

	List<ResumesAllVO> searchResumeByNo(int resumeNo);

}
