package com.it.workit.applicant.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplicantServiceImpl implements ApplicantService{

	@Autowired ApplicantDAO applicantDao;

	@Override
	public ApplicantlistVO selectByUserNo(int userNo) {
		return applicantDao.selectByUserNo(userNo);
	}
}
