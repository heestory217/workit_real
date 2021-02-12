package com.it.workit.recruit.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.language.model.LanguageVO;
import com.it.workit.users.model.arealistVO;

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
	
	@Override
	public List<RecruitannounceVO> selectAllRecruitList(int userNo) {
		return RecruitannounceDao.selectAllRecruitList(userNo);
	}
	
	@Override
	public String recruitcorpwantedlang(int recruitannounceNo) {
		return RecruitannounceDao.recruitcorpwantedlang(recruitannounceNo);
	}

	@Override
	public int recruitdelete(int recruitannounceNo) {
		return RecruitannounceDao.recruitdelete(recruitannounceNo);
	}

	@Override
	public List<LanguageVO> selectcwlanguage() {
		return RecruitannounceDao.selectcwlanguage();
	}

	@Override
	public List<arealistVO> selectcwplace() {
		return RecruitannounceDao.selectcwplace();
	}

	@Override
	public int recruitannouncewrite(RecruitannounceVO vo) {
		return RecruitannounceDao.recruitannouncewrite(vo);
	}

	@Override
	public int recruitannounceedit(RecruitannounceVO vo) {
		return RecruitannounceDao.recruitannounceedit(vo);
	}

	@Override
	public List<AdvertisingVO> selectRecruitadList(AdvertisingVO vo) {
		return RecruitannounceDao.selectRecruitadList(vo);
	}

	@Override
	public int selectadvercount(int recruitannounceNo) {
		return RecruitannounceDao.selectadvercount(recruitannounceNo);
	}

	@Override
	public AdvertisingVO selectadverinfo(int recruitannounceNo) {
		return RecruitannounceDao.selectadverinfo(recruitannounceNo);
	}

	
}