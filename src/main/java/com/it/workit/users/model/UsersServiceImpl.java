package com.it.workit.users.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.it.workit.common.DateSearchVO;
import com.it.workit.common.SHA256Util;
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
	  String salt = SHA256Util.generateSalt();
	  vo.setSalt(salt);
	  
	  String pwd = vo.getUserPassword();
	  pwd = SHA256Util.getEncrypt(pwd, salt);
	  vo.setUserPassword(pwd);
	  
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
      
      String salt = usersDao.selectSaltById(userid);
      password = SHA256Util.getEncrypt(password, salt);
      
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
	System.out.println("usersVO ="+vo);
	if(vo.getUserPassword()!=null && !vo.getUserPassword().isEmpty()) { //비번 변경이 있다면
		String salt = SHA256Util.generateSalt();
		vo.setSalt(salt);
		
		String pwd = vo.getUserPassword();
		pwd = SHA256Util.getEncrypt(pwd, salt);
		vo.setUserPassword(pwd);
	}else { //비번 변경이 없다면
		vo.setUserPassword(null);
	}
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
	  int tempPwd = (Integer)tempUser.get("tempPwd");
	  String pwd = Integer.toString(tempPwd);
	  
	  String salt = SHA256Util.generateSalt();
	  tempUser.put("salt", salt);

	  String shaPwd = SHA256Util.getEncrypt(pwd, salt);
	  tempUser.put("shaPwd", shaPwd);
	  
      return usersDao.updatePwd(tempUser);
   }

   @Override
   @Transactional
   public int updatePwdReal(Map<String, Object> userMap) {
      
      String userId = (String)userMap.get("userId");
      String tempPwd = (String)userMap.get("userTemp");
      int cnt = loginCheck(userId, tempPwd);
      System.out.println("로그인 결과 cnt "+cnt);
      
      if(cnt==LOGIN_OK) {
    	  String salt = SHA256Util.generateSalt();
    	  userMap.put("salt", salt);
    	  
    	  String realPwd = (String)userMap.get("userPwd");
    	  String shaPwd = SHA256Util.getEncrypt(realPwd, salt);
    	  
    	  userMap.put("userId", userId);
    	  userMap.put("shaPwd", shaPwd);
    	  userMap.put("salt", salt);
    	  
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

   @Override
   public List<UsersVO> selectWithdrawUsersAll(SearchVO searchVo) {
      return usersDao.selectWithdrawUsersAll(searchVo);
   }

   @Override
   public int totalWithdrawUsers(SearchVO searchVo) {
      return usersDao.totalWithdrawUsers(searchVo);
   }

   @Override
   public int withdrawUsers(int userNo) {
      return usersDao.withdrawUsers(userNo);
   }

   @Override
   public int selectTotalIndivUsers() {
      return usersDao.selectTotalIndivUsers();
   }

   @Override
   public int selectTotalCorpUsers() {
      return usersDao.selectTotalCorpUsers();
   }

   @Override
   public int selectTotalIndivWithdrawUsers() {
      return usersDao.selectTotalIndivWithdrawUsers();
   }

   @Override
   public int selectTotalCorpWithdrawUsers() {
      return usersDao.selectTotalCorpWithdrawUsers();
   }

   @Override
   public int selectTotalUserByDate(DateSearchVO dateSearchVo) {
      return usersDao.selectTotalUserByDate(dateSearchVo);
   }

   @Override
   public int selectTotalCorpByDate(DateSearchVO dateSearchVo) {
      return usersDao.selectTotalCorpByDate(dateSearchVo);
   }

   @Override
   public int selectTotalWithdrawUsersByDate(DateSearchVO dateSearchVo) {
      return usersDao.selectTotalWithdrawUsersByDate(dateSearchVo);
   }

   @Override
   public int selectTotalWithdrawCorpByDate(DateSearchVO dateSearchVo) {
      return usersDao.selectTotalWithdrawCorpByDate(dateSearchVo);
   }

   @Override
   public int updateCorpUsers(UsersVO vo) {
   System.out.println("usersVO ="+vo);
		if(vo.getUserPassword()!=null && !vo.getUserPassword().isEmpty()) { //비번 변경이 있다면
			String salt = SHA256Util.generateSalt();
			vo.setSalt(salt);
			
			String pwd = vo.getUserPassword();
			pwd = SHA256Util.getEncrypt(pwd, salt);
			vo.setUserPassword(pwd);
		}else { //비번 변경이 없다면
			vo.setUserPassword(null);
		}
      return usersDao.updateCorpUsers(vo);
   }

   @Override
   public List<UsersVO> usersAll() {
      return usersDao.usersAll();
   }

	@Override
	public int updateEnddate(String userId) {
		return usersDao.updateEnddate(userId);
	}


}