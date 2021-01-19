package com.it.workit.corp.model;

import java.util.List;

public interface CorpDAO {

	int insertCorp(CorpVO vo);
	CorpAllVO selectCorp(int corpNo);
	int insertImg(CorpimgVO vo);
	List<CorpimgVO> corpImgList (int corpNo);
}
