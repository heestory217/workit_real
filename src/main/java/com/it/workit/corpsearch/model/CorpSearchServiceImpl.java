package com.it.workit.corpsearch.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.common.SearchVO;
import com.it.workit.resumes.model.ResumesAllVO;

@Service
public class CorpSearchServiceImpl implements CorpSearchService{
	@Autowired private CorpSearchDAO searchDao;

	@Override
	public List<ResumesAllVO> searchDefault(SearchVO searchVo) {
		return searchDao.searchDefault(searchVo);
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return searchDao.selectTotalRecord(searchVo);
	}


}
