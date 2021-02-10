package com.it.workit.admin.managers.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ManagersDAOMybatis implements ManagersDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.managers.";
	
	@Override
	public String loginCheck(String userid, String password) {
		return sqlSession.selectOne(namespace+"loginCheck", userid);
	}

	@Override
	public ManagersVO selectByManagersId(String managersid) {
		return sqlSession.selectOne(namespace+"selectByManagersId", managersid);
	}
}