package com.it.workit.users.model;

public interface UsersDAO {
	public int checkDup(String userid);
	public String loginCheck(String userid, String password);
}
