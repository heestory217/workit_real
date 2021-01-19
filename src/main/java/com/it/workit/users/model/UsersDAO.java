package com.it.workit.users.model;


public interface UsersDAO {
	public int checkDup(String userid);
	public int insertUsers(UsersVO vo);
}
