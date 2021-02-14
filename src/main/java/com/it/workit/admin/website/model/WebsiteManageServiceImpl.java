package com.it.workit.admin.website.model;

import java.util.Map;

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
	
	@Override
	public int insertWebsiteManage(WebsiteManageVO vo) {
		return websiteDao.insertWebsiteManage(vo);
	}

	@Override
	public Map<String, Object> selectWebsiteManage(String websitemanageKind) {
		return websiteDao.selectWebsiteManage(websitemanageKind);
	}

	@Override
	public int updateWebsiteManage(WebsiteManageVO vo) {
		return websiteDao.updateWebsiteManage(vo);
	}
}
