package com.it.workit.users.model;

public interface UsersService {
	//아이디 중복확인시 사용
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우
	
	public int checkDup(String userid);
	public int insertUsers(UsersVO vo);
}
