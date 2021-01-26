package com.it.workit.recruit.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecruitannounceServiceImpl implements RecruitannounceService {
	
	@Autowired
	private RecruitannounceDAO RecruitannounceDao;

	@Override
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo) {
		return RecruitannounceDao.recruitannounceselectByNo(recruitannounceNo);
	}

	@Override
	public String recruitcorpwantwork(int recruitannounceNo) {
		return RecruitannounceDao.recruitcorpwantwork(recruitannounceNo);
	}
	
	@Override
	public String recruitcorpwantedarea(int recruitannounceNo) {
		return RecruitannounceDao.recruitcorpwantedarea(recruitannounceNo);
	}

	@Override
	public List<RecruitannounceVO> selectRecruitList(int userNo) {
		return RecruitannounceDao.selectRecruitList(userNo);
	}
	

}