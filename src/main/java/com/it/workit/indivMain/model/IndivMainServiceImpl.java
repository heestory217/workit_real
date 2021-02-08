package com.it.workit.indivMain.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IndivMainServiceImpl implements IndivMainService{
	@Autowired private IndivMainDAO indivMainDao;
	
	//채용 마감 임박순
	@Override
	public List<Map<String, Object>> selectByDeadline() {
		return indivMainDao.selectByDeadline();
	}
	
	//신규 채용 공고
	@Override
	public List<Map<String, Object>> selectNesPost() {
		return indivMainDao.selectNesPost();
	}
	
	
}
