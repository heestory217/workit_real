package com.it.workit.recruit.model;

import java.util.List;

public interface RecruitannounceDAO {
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo);
	public String recruitcorpwantwork(int recruitannounceNo);
	public String recruitcorpwantedarea(int recruitannounceNo);
	public List<RecruitannounceVO> selectRecruitList(int userNo);
}
