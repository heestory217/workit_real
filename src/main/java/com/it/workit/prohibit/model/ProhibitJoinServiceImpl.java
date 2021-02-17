package com.it.workit.prohibit.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.applicant.model.CorpApplicantPagingVO;

@Service
public class ProhibitJoinServiceImpl implements ProhibitJoinService {
	@Autowired private ProhibitJoinDAO prohibitDao;

	@Override
	public int insertProhibit(ProhibitJoinVO vo) {
		return prohibitDao.insertProhibit(vo);
	}

	@Override
	public int selectIfProhibited(int userIndivNo) {
		return prohibitDao.selectIfProhibited(userIndivNo);
	}

	@Override
	public List<Map<String, Object>> selectProhibitedList(ProhibitJoinPagingVO vo) {
		return prohibitDao.selectProhibitedList(vo);
	}

	@Override
	public int deleteFromProhibit(int userIndivNo) {
		return prohibitDao.deleteFromProhibit(userIndivNo);
	}

	@Override
	public int selectProhibitTotal(int userCorpNo) {
		return prohibitDao.selectProhibitTotal(userCorpNo);
	}
	
}
