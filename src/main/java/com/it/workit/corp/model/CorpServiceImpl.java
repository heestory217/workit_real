package com.it.workit.corp.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CorpServiceImpl implements CorpService {

	@Autowired private CorpDAO corpDao;
	
	@Override
	public int insertCorp(CorpVO vo) {
		return corpDao.insertCorp(vo);
	}

	@Override
	public CorpVO selectCorp(int corpNo) {
		return corpDao.selectCorp(corpNo);
	}

}
