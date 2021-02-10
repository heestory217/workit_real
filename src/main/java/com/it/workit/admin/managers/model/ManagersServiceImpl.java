package com.it.workit.admin.managers.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class ManagersServiceImpl implements ManagersService {
	
	@Autowired private ManagersDAO adminusersDao;
	
	@Override
	public int loginCheck(String userid, String password) {
		int result=0;
		
		if(adminusersDao.loginCheck(userid, password)==null || adminusersDao.loginCheck(userid, password).isEmpty()) {
			result=ID_NONE;
			return result;
		}
		
		String pass=adminusersDao.loginCheck(userid, password);
		if(pass.equals(password)) {
			result=LOGIN_OK;
		}else if(!(pass==null || pass.isEmpty())){
			result=PWD_DISAGREE;
		}
		
		return result;
	}

	@Override
	public ManagersVO selectByManagersId(String managersid) {
		return adminusersDao.selectByManagersId(managersid);
	}	
	
}
