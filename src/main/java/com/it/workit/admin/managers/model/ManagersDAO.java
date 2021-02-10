package com.it.workit.admin.managers.model;

public interface ManagersDAO {
	public String loginCheck(String userid, String password);
	public ManagersVO selectByManagersId(String managersid);
}
