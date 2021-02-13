package com.it.workit.corp.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;
import com.it.workit.corpsearch.model.MatchSearchVO;

public interface CorpService {
	int insertCorp(CorpVO vo, List<CorpimgVO> imgList);
	CorpVO selectCorp(int corpNo);
	List<CorpimgVO> corpImgList (int corpNo);
	List<CorpRecruitViewVO> selectRecruit(int corpNo);
	int editCorp(CorpVO vo);
	int editCorpImg(List<CorpimgVO> imgList);
	int selectCorpNo(int userNo);
	List<Map<String, Object>> selectRecruitList(int userNo);
	List<AppResumeUserAllVO> selectResumeView(int recruitannounceNo);
	List<AreaListView> selectAreaList(int resumeNo);
	List<LanguageListView> selectLanguageList(int resumeNo);
	List<Integer> selectResumeNoList(List<MatchSearchVO> mList);
	public int insertCorpReview(CorpreviewVO vo);
	
	//admin
	List<CorpVO> selectCorpList(SearchVO searchVo);
	int selectCorpListCount(SearchVO searchVo);
	List<CorpAllVo> selectCorpWaitingList();
	List<CorpimgVO> selectCorpWaitingImgList(int corpNo);
	
	int corpOkCheck(String corpNo);
	int corpReject(String corpNo);
	int corpWating(String corpNo);
}
