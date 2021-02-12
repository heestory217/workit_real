package com.it.workit.admin.website;

public interface WebsiteManageDAO {
	//전체 방문자수 update
	public int updateTotalCount();
	//전체 방문자수 select
	public int selectTotalVisitor();
}
