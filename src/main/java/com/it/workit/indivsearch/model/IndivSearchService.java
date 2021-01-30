package com.it.workit.indivsearch.model;

import java.util.List;

public interface IndivSearchService {
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword);
}
