package com.it.workit.users.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;

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
	
	/* 관리자 사용 */
	public List<UsersVO> selectIndivUsersAll(SearchVO searchVo);
	public List<UsersVO> selectWithdrawUsersAll(SearchVO searchVo);
	public int totalUsers(SearchVO searchVo);
	public int totalWithdrawUsers(SearchVO searchVo);
	public int withdrawUsers(int userNo);
	public int selectTotalIndivUsers();
	public int selectTotalCorpUsers();
	public int selectTotalIndivWithdrawUsers();
	public int selectTotalCorpWithdrawUsers();
}
