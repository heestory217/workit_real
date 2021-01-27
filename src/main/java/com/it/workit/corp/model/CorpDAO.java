package com.it.workit.corp.model;

import java.util.List;
import java.util.Map;

import com.it.workit.corpsearch.model.MatchSearchVO;

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
	List<AppResumeUserAllVO> selectResumeView(int recruitannounceNo);
	List<AreaListView> selectAreaList(int resumeNo);
	List<LanguageListView> selectLanguageList(int resumeNo);
	List<Integer> selectResumeNoList(MatchSearchVO matchSearchVO);
}
