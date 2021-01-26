package com.it.workit.recruit.model;


public interface RecruitannounceDAO {
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo);
	public String recruitcorpwantwork(int recruitannounceNo);
	public String recruitcorpwantedarea(int recruitannounceNo);
}
