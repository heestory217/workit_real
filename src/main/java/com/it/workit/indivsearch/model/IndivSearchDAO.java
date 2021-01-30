package com.it.workit.indivsearch.model;

import java.util.List;

public interface IndivSearchDAO {
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword);
}
