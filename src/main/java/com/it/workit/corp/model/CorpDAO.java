package com.it.workit.corp.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;
import com.it.workit.corpsearch.model.MatchSearchVO;

public interface CorpDAO {

	int insertCorp(CorpVO vo);
	CorpVO selectCorp(int corpNo);
	int insertImg(CorpimgVO vo);
	List<CorpimgVO> corpImgList (int corpNo);
	List<CorpRecruitViewVO> selectRecruit(int corpNo);
	int editCorp(CorpVO vo);
	int editCorpImg(CorpimgVO vo);
	int selectCorpNo(int userNo);
	List<Map<String, Object>> selectRecruitList(int userNo);
	List<AppResumeUserAllVO> selectResumeView(int recruitannounceNo);
	List<AreaListView> selectAreaList(int resumeNo);
	List<LanguageListView> selectLanguageList(int resumeNo);
	List<Integer> selectResumeNoList(MatchSearchVO matchSearchVO);
	
	public int insertCorpReview(CorpreviewVO vo);
	
	//admin
	List<CorpVO> selectCorpList(SearchVO searchVo);
	int selectCorpListCount(SearchVO searchVo);
	List<CorpAllVo> selectCorpWaitingList();
	List<CorpimgVO> selectCorpWaitingImgList(int corpNo);
	int corpOkCheck(String corpNo);
	int corpReject(String corpNo);
	int corpWaiting(String corpNo);
}
