package com.it.workit.recruit.model;

import java.util.List;

import com.it.workit.language.model.LanguageVO;
import com.it.workit.users.model.arealistVO;

public interface RecruitannounceService {
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo);
	public String recruitcorpwantwork(int recruitannounceNo);
	public String recruitcorpwantedarea(int recruitannounceNo);
	public String recruitcorpwantedlang(int recruitannounceNo);
	public List<RecruitannounceVO> selectRecruitList(int userNo);
	public List<RecruitannounceVO> selectAllRecruitList(int userNo);
	
	public int recruitdelete(int recruitannounceNo);
	public List<LanguageVO> selectcwlanguage();
	public List<arealistVO> selectcwplace();
	public int recruitannouncewrite(RecruitannounceVO vo);
	public int recruitannounceedit(RecruitannounceVO vo);
	
	public List<AdvertisingVO> selectRecruitadList(AdvertisingVO vo);
	public int selectadvercount(int recruitannounceNo);
	public AdvertisingVO selectadverinfo(int recruitannounceNo);
}
