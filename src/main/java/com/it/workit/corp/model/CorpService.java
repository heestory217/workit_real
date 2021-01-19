package com.it.workit.corp.model;

import java.util.List;

public interface CorpService {
	int insertCorp(CorpVO vo, List<CorpimgVO> imgList);
	CorpVO selectCorp(int corpNo);
}
