package com.it.workit.users.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UsersDAOMybatis implements UsersDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.users.";
	
	//아이디 중복체크
	public int checkDup(String userid) {
		int count = sqlSession.selectOne(namespace+"dupCheck", userid);
		return count;
	}
	
	//로그인확인
	public String loginCheck(String userid, String password) {
		String pass = sqlSession.selectOne(namespace+"loginCheck", userid);
		
		return pass;
	}
	
	//아이디로 정보 불러오기
	public UsersVO selectUser(String userid) {
		UsersVO vo = sqlSession.selectOne(namespace+"selectUser", userid);
		return null;
	}
}
