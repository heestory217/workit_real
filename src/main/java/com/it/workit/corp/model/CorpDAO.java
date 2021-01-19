package com.it.workit.corp.model;

public interface CorpDAO {

	int insertCorp(CorpVO vo);

	CorpVO selectCorp(int corpNo);

	int insertImg(CorpimgVO vo);

}
