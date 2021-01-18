package com.it.workit.users.model;

import org.springframework.beans.factory.annotation.Autowired;

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

}
