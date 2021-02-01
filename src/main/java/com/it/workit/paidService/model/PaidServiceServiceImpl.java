package com.it.workit.paidService.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaidServiceServiceImpl implements PaidServiceService{
	@Autowired private PaidServiceDAO paidServiceDao;

	@Override
	public PaidServiceVO selectPaidServByServiceNo(int paidServiceNo) {
		return paidServiceDao.selectPaidServByServiceNo(paidServiceNo);
	}
}
