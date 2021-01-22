package com.it.workit.users.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

}
