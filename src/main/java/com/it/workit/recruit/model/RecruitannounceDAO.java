package com.it.workit.recruit.model;

import java.util.List;

import com.it.workit.language.model.LanguageVO;
import com.it.workit.users.model.arealistVO;

public interface RecruitannounceDAO {
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo);
	public String recruitcorpwantwork(int recruitannounceNo);
	public String recruitcorpwantedarea(int recruitannounceNo);
	public String recruitcorpwantedlang(int recruitannounceNo);
	public List<RecruitannounceVO> selectRecruitList(int userNo);
	public int recruitdelete(int recruitannounceNo);
	public List<LanguageVO> selectcwlanguage();
	public List<arealistVO> selectcwplace();
	public int recruitannouncewrite(RecruitannounceVO vo);
	public int recruitannounceedit(RecruitannounceVO vo);
}
