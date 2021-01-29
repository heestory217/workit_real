package com.it.workit.corpsearch.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.common.SearchVO;

@Service
public class CorpSearchServiceImpl implements CorpSearchService{
	@Autowired private CorpSearchDAO searchDao;

	@Override
	public List<Integer> searchDefault(SearchVO searchVo) {
		return searchDao.searchDefault(searchVo);
	}


}
