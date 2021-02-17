package com.it.workit.recruit.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.common.SearchVO;
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
	
	@Override
	public int recruitannouncecount(SearchVO searchVo) {
		return RecruitannounceDao.recruitannouncecount(searchVo);
	}

	@Override
	public List<RecruitannounceVO> recruitannounceall(SearchVO searchVo) {
		return RecruitannounceDao.recruitannounceall(searchVo);
	}

	@Override
	public int recruitGetTotalRecord(AdvertisingVO vo) {
		return RecruitannounceDao.recruitGetTotalRecord(vo);
	}

	@Override
	public int recruitannouncerollback(int recruitannounceNo) {
		return RecruitannounceDao.recruitannouncerollback(recruitannounceNo);
	}

	@Override
	public int recruitannounceallowed(int recruitannounceNo) {
		return RecruitannounceDao.recruitannounceallowed(recruitannounceNo);
	}

	@Override
	public int recruitannouncedeny(int recruitannounceNo) {
		return RecruitannounceDao.recruitannouncedeny(recruitannounceNo);
	}

	@Override
	public List<AdminadvertisingVO> selectadvertisingfstclass() {
		return RecruitannounceDao.selectadvertisingfstclass();
	}

	@Override
	public List<AdminadvertisingVO> selectadvertisingsecclass() {
		return RecruitannounceDao.selectadvertisingsecclass();
	}
	@Override
	public int selectadvertisingcountfst() {
		return RecruitannounceDao.selectadvertisingcountfst();
	}

	@Override
	public int selectadvertisingcountsec() {
		return RecruitannounceDao.selectadvertisingcountsec();
	}

	@Override
	public List<AdminadvertisingVO> selectadvertisinglist(SearchVO searchVo) {
		return RecruitannounceDao.selectadvertisinglist(searchVo);
	}

	@Override
	public int selectadvertisinglistcount(SearchVO searchVo) {
		return RecruitannounceDao.selectadvertisinglistcount(searchVo);
	}
	
	@Override
	public int advertisingallowedseven(int recruitannounceNo) {
		return RecruitannounceDao.advertisingallowedseven(recruitannounceNo);
	}

	@Override
	public int advertisingallowedfift(int recruitannounceNo) {
		return RecruitannounceDao.advertisingallowedfift(recruitannounceNo);
	}

	@Override
	public int advertisingallowedmonth(int recruitannounceNo) {
		return RecruitannounceDao.advertisingallowedmonth(recruitannounceNo);
	}

	@Override
	public int advertisingdeny(int recruitannounceNo) {
		return RecruitannounceDao.advertisingdeny(recruitannounceNo);
	}
}