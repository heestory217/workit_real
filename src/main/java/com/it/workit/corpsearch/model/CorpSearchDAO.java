package com.it.workit.corpsearch.model;

import java.util.List;

import com.it.workit.common.SearchVO;
import com.it.workit.resumes.model.ResumesAllVO;

public interface CorpSearchDAO {

	List<ResumesAllVO> searchDefault(SearchVO searchVo);

	int selectTotalRecord(SearchVO searchVo);

}
