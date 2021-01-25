package com.it.workit.corp.model;

import java.util.List;
import java.util.Map;

public interface CorpService {
	int insertCorp(CorpVO vo, List<CorpimgVO> imgList);
	CorpVO selectCorp(int corpNo);
	List<CorpimgVO> corpImgList (int corpNo);
	List<CorpRecruitViewVO> selectRecruit(int userNo);
	int editCorp(CorpVO vo);
	int editCorpImg(List<CorpimgVO> imgList);
	int selectCorpNo(int userNo);
	List<Map<String, Object>> selectRecruitList(int userNo);
	List<Map<String, Object>> selectAppList(int recruitannounceNo);
}
