package com.it.workit.manage.model;

public interface ManageDAO {
	//전체 방문자수 update
	public int updateTotalCount();
	//전체 방문자수 select
	public int selectTotalVisitor();
}
