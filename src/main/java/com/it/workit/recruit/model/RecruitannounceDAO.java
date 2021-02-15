package com.it.workit.recruit.model;

import java.util.List;

import com.it.workit.common.SearchVO;
import com.it.workit.language.model.LanguageVO;
import com.it.workit.users.model.arealistVO;

public interface RecruitannounceDAO {
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo);
	public String recruitcorpwantwork(int recruitannounceNo);
	public String recruitcorpwantedarea(int recruitannounceNo);
	public String recruitcorpwantedlang(int recruitannounceNo);
	public List<RecruitannounceVO> selectRecruitList(int userNo);	//메인 최근기준 3개 한정
	public List<RecruitannounceVO> selectAllRecruitList(int userNo);	//전체 리스트
	
	public int recruitdelete(int recruitannounceNo);
	public List<LanguageVO> selectcwlanguage();
	public List<arealistVO> selectcwplace();
	public int recruitannouncewrite(RecruitannounceVO vo);
	public int recruitannounceedit(RecruitannounceVO vo);
	
	public List<AdvertisingVO> selectRecruitadList(AdvertisingVO vo);
	public int selectadvercount(int recruitannounceNo);
	public AdvertisingVO selectadverinfo(int recruitannounceNo);
	public int recruitGetTotalRecord(AdvertisingVO vo);
	
	//관리자
	public int recruitannouncecount(SearchVO searchVo);
	public List<RecruitannounceVO> recruitannounceall(SearchVO searchVo);
	
	public int recruitannouncerollback(int recruitannounceNo);
	public int recruitannounceallowed(int recruitannounceNo);
	public int recruitannouncedeny(int recruitannounceNo);
}
