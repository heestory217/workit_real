package com.it.workit.prohibit.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProhibitJoinServiceImpl implements ProhibitJoinService {
	@Autowired private ProhibitJoinDAO prohibitDao;

	@Override
	public int insertProhibit(ProhibitJoinVO vo) {
		return prohibitDao.insertProhibit(vo);
	}

	@Override
	public int selectIfProhibited(int userPersonalNo) {
		return prohibitDao.selectIfProhibited(userPersonalNo);
	}
	
}
