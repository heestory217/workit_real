package com.it.workit.getposition.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GetPositionServiceImpl implements GetPositionService {
	@Autowired private GetPositionDAO getPositionDao;

	@Override
	public int updateReadCount(int positionsuggestNo) {
		return getPositionDao.updateReadCount(positionsuggestNo);
	}

	@Override
	public int deleteGetPSG(int positionsuggestNo) {
		return getPositionDao.deleteGetPSG(positionsuggestNo);
	}

}
