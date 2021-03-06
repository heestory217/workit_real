package com.it.workit.corpsearch.model;

import java.util.List;

import com.it.workit.common.SearchVO;
import com.it.workit.resumes.model.ResumesAllVO;

public interface CorpSearchService {

	List<ResumesAllVO> searchDefault(CorpReSearchAllVO searchVo);
	ResumesAllVO searchDefault(int resumeNO);

	int selectTotalRecord(SearchVO searchVo);

}
