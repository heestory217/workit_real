package com.it.workit.applicant.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplicantServiceImpl implements ApplicantService{

	@Autowired ApplicantDAO applicantDao;

	@Override
	public ApplicantlistVO selectByUserNo(int userNo) {
		return applicantDao.selectByUserNo(userNo);
	}

	@Override
	public int selectApplyCountByUserNo(int userNo) {
		return applicantDao.selectApplyCountByUserNo(userNo);
	}

	@Override
	public int selectPassCountByUserNo(int userNo) {
		return applicantDao.selectPassCountByUserNo(userNo);
	}

	@Override
	public int selectFailCountByUserNo(int userNo) {
		return applicantDao.selectFailCountByUserNo(userNo);
	}

	@Override
	public List<ApplicantlistVO> selectApplyAllByUserNo(int userNo) {
		return applicantDao.selectApplyAllByUserNo(userNo);
	}

	@Override
	public List<ApplicantlistVO> selectPassAllByUserNo(int userNo) {
		return applicantDao.selectPassAllByUserNo(userNo);
	}

	@Override
	public List<ApplicantlistVO> selectFailAllByUserNo(int userNo) {
		return applicantDao.selectFailAllByUserNo(userNo);
	}
}
