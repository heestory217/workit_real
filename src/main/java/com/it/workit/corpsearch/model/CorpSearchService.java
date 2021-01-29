package com.it.workit.corpsearch.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public interface CorpSearchService {

	List<Integer> searchDefault(SearchVO searchVo);

}
