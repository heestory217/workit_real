package com.it.workit.admin.website.model;

import java.util.Map;

public interface WebsiteManageDAO {
	//전체 방문자수 update
	public int updateTotalCount();
	//전체 방문자수 select
	public int selectTotalVisitor();
	
	//웹사이트 관리 데이터 등록
	int insertWebsiteManage(WebsiteManageVO vo);
	
	//사이트소개
	Map<String, Object> selectSiteIntro();
	int updateSiteIntro (WebsiteManageVO vo);
}
