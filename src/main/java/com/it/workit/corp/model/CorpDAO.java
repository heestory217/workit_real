package com.it.workit.corp.model;

import java.util.List;
import java.util.Map;

public interface CorpDAO {

	int insertCorp(CorpVO vo);
	CorpVO selectCorp(int corpNo);
	int insertImg(CorpimgVO vo);
	List<CorpimgVO> corpImgList (int corpNo);
	List<CorpRecruitViewVO> selectRecruit(int userNo);
	int editCorp(CorpVO vo);
	int editCorpImg(CorpimgVO vo);
	int selectCorpNo(int userNo);
	List<Map<String, Object>> selectRecruitList(int userNo);
}
