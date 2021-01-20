package com.it.workit.users.model;

public interface UsersService {
	//아이디 중복확인시 사용
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우

	//로그인 확인시 사용됨
	public static final int LOGIN_OK=1;
	public static final int LOGIN_FAIL=2;

	public int checkDup(String userid);
	public int insertUsers(UsersVO vo);

	//동현 로그인 체크
	//public int loginCheck(String userid, String password);

	//희정 유저번호, 아이디별 조회
	public UsersVO selectByUserNo(int userNo);
	public UsersVO selectByUserId(String userId);

}
