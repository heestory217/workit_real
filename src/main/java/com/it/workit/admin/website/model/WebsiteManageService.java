package com.it.workit.admin.website.model;

import java.util.Map;

public interface WebsiteManageService {
	public int updateTotalCount();
	public int selectTotalVisitor();
	
	//웹사이트 관리 데이터 등록
	int insertWebsiteManage(WebsiteManageVO vo);
	
	//사이트소개
	Map<String, Object> selectSiteIntro();
	int updateSiteIntro (WebsiteManageVO vo);
}
