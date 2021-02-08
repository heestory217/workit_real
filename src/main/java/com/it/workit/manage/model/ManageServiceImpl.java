package com.it.workit.manage.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManageServiceImpl implements ManageService{
	
	@Autowired ManageDAO manageDao;

	@Override
	public int updateTotalCount() {
		return manageDao.updateTotalCount();
	}

	@Override
	public int selectTotalVisitor() {
		return manageDao.selectTotalVisitor();
	}
	
}
