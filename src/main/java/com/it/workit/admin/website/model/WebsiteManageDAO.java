package com.it.workit.admin.website.model;

import java.util.Map;

public interface WebsiteManageDAO {
	//전체 방문자수 update
	public int updateTotalCount();
	//전체 방문자수 select
	public int selectTotalVisitor();
	
	//웹사이트 관리 데이터
	int insertWebsiteManage(WebsiteManageVO vo);
	Map<String, Object> selectWebsiteManage(String websitemanageKind);
	int updateWebsiteManage (WebsiteManageVO vo);
}
