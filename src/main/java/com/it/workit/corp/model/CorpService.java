package com.it.workit.corp.model;

import java.util.List;

public interface CorpService {
	int insertCorp(CorpVO vo, List<CorpimgVO> imgList);
	CorpVO selectCorp(int corpNo);
	List<CorpimgVO> corpImgList (int corpNo);
	List<CorpRecruitViewVO> selectRecruit(int userNo);
	int editCorp(CorpVO vo);
	int editCorpImg(List<CorpimgVO> imgList);
}
