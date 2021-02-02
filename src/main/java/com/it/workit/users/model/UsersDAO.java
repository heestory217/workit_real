package com.it.workit.users.model;

import java.util.Map;

public interface UsersDAO {
	public int checkDup(String userid);
	public int insertUsers(UsersVO vo);
	public UsersVO selectByUserNo(int userNo);
	public UsersVO selectByUserId(String userId);
	public String loginCheck(String userid, String password);
	public int updateUsers(UsersVO vo);
	public int userkindcheck(String userid);
	public int updateUserCorpCheck(int userNo);
	public String findId(Map<String, Object> eMailMap);
	public int findPwd(Map<String, Object> findPwdMap);
	public int updatePwd(Map<String, Object> tempUser);
	
	public int selectUser(Map<String, Object> userMap);
	public int updatePwdReal(Map<String, Object> userMap);
}
