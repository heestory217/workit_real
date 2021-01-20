package com.it.workit.users.model;


public interface UsersDAO {
	public int checkDup(String userid);
	public int insertUsers(UsersVO vo);
	//public String loginCheck(String userid, String password);
	public UsersVO selectByUserNo(int userNo);
	public UsersVO selectByUserId(String userId);
}
