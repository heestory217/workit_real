package com.it.workit.users.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.workit.common.SearchVO;

@Service
public class UsersServiceImpl implements UsersService{

	@Autowired
	private UsersDAO usersDao;

	@Override
	public int checkDup(String userid) {
		int count=usersDao.checkDup(userid);

		int result=0;
		if(count>0) {
			result=EXIST_ID;  //해당 아이디 존재
		}else {
			result=NON_EXIST_ID; //해당 아이디 존재 X
		}
		return result;
	}

	@Override
	public int insertUsers(UsersVO vo) {
		int cnt=usersDao.insertUsers(vo);
		return cnt;
	}
	
	@Override
	public int loginCheck(String userid, String password) {
		int result=0;
		if(usersDao.loginCheck(userid, password)==null || usersDao.loginCheck(userid, password).isEmpty()) {
			result=ID_NONE;
			return result;
		}
		
		String pass=usersDao.loginCheck(userid, password);
		if(pass.equals(password)) {
			result=LOGIN_OK;
		}else if(!(pass==null || pass.isEmpty())){
			result=PWD_DISAGREE;
		}
		return result;
	}
	
	@Override
	public UsersVO selectByUserNo(int userNo) {
		return usersDao.selectByUserNo(userNo);
	}

	@Override
	public UsersVO selectByUserId(String userId) {
		return usersDao.selectByUserId(userId);
	}

	@Override
	public int updateUsers(UsersVO vo) {
		return usersDao.updateUsers(vo);
	}

	@Override
	public int userkindcheck(String userid) {
		return usersDao.userkindcheck(userid);
	}

	@Override
	public String findId(Map<String, Object> eMailMap) {
		return usersDao.findId(eMailMap);
	}

	@Override
	public int findPwd(Map<String, Object> findPwdMap) {
		return usersDao.findPwd(findPwdMap); // cnt : 1
	}

	@Override
	public int updatePwd(Map<String, Object> tempUser) {
		return usersDao.updatePwd(tempUser);
	}

	@Override
	@Transactional
	public int updatePwdReal(Map<String, Object> userMap) {
		int cnt = usersDao.selectUser(userMap);
		if(cnt>0) {
			cnt = usersDao.updatePwdReal(userMap);
		}else {
			cnt = -1;
		}
		return cnt;
	}

	@Override
	public List<UsersVO> selectIndivUsersAll(SearchVO searchVo) {
		return usersDao.selectIndivUsersAll(searchVo);
	}

	@Override
	public int totalUsers(SearchVO searchVo) {
		return usersDao.totalUsers(searchVo);
	}

}
