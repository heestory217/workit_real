package com.it.workit.admin.managers.model;

public interface ManagersService {
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우

	//로그인 확인시 사용됨
	public static final int LOGIN_OK=1;//로그인됨
	public static final int PWD_DISAGREE=2;//비밀번호오류
	public static final int ID_NONE=3;//아이디오류
	
	public int loginCheck(String userid, String password);
	public ManagersVO selectByManagersId(String managersid);
}
