package com.it.workit.admin.website;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WebsiteManageServiceImpl implements WebsiteManageService{
	@Autowired private WebsiteManageDAO websiteDao;

	@Override
	public int updateTotalCount() {
		return websiteDao.updateTotalCount();
	}

	@Override
	public int selectTotalVisitor() {
		return websiteDao.selectTotalVisitor();
	}
}
