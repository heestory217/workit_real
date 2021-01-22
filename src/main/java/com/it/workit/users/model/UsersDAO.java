package com.it.workit.users.model;

public interface UsersDAO {
	public int checkDup(String userid);
	public int insertUsers(UsersVO vo);
	public UsersVO selectByUserNo(int userNo);
	public UsersVO selectByUserId(String userId);
	public String loginCheck(String userid, String password);
	public int updateUsers(UsersVO vo);
}
