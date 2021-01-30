package com.it.workit.indivsearch.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndivSearchServiceImpl implements IndivSearchService{
	@Autowired
	private IndivSearchDAO indivSearchDao;

	@Override
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword) {
		return indivSearchDao.selectIndivKeyword(keyword);
	}
}
