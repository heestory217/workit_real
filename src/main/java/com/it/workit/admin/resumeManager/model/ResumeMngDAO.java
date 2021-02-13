package com.it.workit.admin.resumeManager.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;

public interface ResumeMngDAO {
	//리스트 
	public List<Map<String, Object>> resumeByOpenNo(SearchVO searchVo);
	
	//전체 카운트
	public int rsOpenTotal(SearchVO searchVo);
	
	//승인
	public int resumreAck(int resumeNo);
}
