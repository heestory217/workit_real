package com.it.workit.users.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;

public interface UsersService {
	//아이디 중복확인시 사용
	public static final int EXIST_ID=1;  //아이디가 이미 존재하는 경우
	public static final int NON_EXIST_ID=2; //존재하지 않는 경우

	//로그인 확인시 사용됨
	public static final int LOGIN_OK=1;//로그인됨
	public static final int PWD_DISAGREE=2;//비밀번호오류
	public static final int ID_NONE=3;//아이디오류
	
	public static final int KIND_NORMAL=1;//일반화원
	public static final int KIND_CORP=2;//기업회원
	public static final int KIND_MASTER=3;//관리자

	public int checkDup(String userid);
	public int insertUsers(UsersVO vo);

	//동현 로그인 체크
	public int loginCheck(String userid, String password);
	public int userkindcheck(String userid);

	//희정 유저번호, 아이디별 조회
	public UsersVO selectByUserNo(int userNo);
	public UsersVO selectByUserId(String userId);
	
	public int updateUsers(UsersVO vo);
	
	//수하 이메일로 아이디 , 비번찾기 , 비번 재설정
	public String findId(Map<String, Object> eMailMap);
	public int findPwd(Map<String, Object> findPwdMap);
	public int updatePwd(Map<String, Object> tempUser);
	
	public int updatePwdReal(Map<String, Object> userMap);
	
	//은별 관리자사용, 개인회원 조회
	public List<UsersVO> selectIndivUsersAll(SearchVO searchVo);
	public int totalUsers(SearchVO searchVo);
	
}
