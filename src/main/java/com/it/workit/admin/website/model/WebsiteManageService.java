package com.it.workit.admin.website.model;

import java.util.Map;

public interface WebsiteManageService {
	public int updateTotalCount();
	public int selectTotalVisitor();
	
	//웹사이트 관리 데이터
	int insertWebsiteManage(WebsiteManageVO vo);
	Map<String, Object> selectWebsiteManage(String websitemanageKind);
	int updateWebsiteManage (WebsiteManageVO vo);
}
