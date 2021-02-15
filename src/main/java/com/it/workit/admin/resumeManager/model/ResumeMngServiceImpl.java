package com.it.workit.admin.resumeManager.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.common.SearchVO;

@Service
public class ResumeMngServiceImpl implements ResumeMngService{
	
	@Autowired ResumeMngDAO rsMngDao;
	
	@Override
	public List<Map<String, Object>> resumeByOpenNo(SearchVO searchVo) {
		return rsMngDao.resumeByOpenNo(searchVo);
	}

	@Override
	public int rsOpenTotal(SearchVO searchVo) {
		return rsMngDao.rsOpenTotal(searchVo);
	}

	@Override
	public int resumreAck(int resumeNo) {
		return rsMngDao.resumreAck(resumeNo);
	}

	@Override
	public int resumreBack(int resumeNo) {
		return rsMngDao.resumreBack(resumeNo);
	}

}
