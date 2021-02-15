package com.it.workit.admin.resumeManager.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;

@Repository
public class ResumeMngDAOMybatis implements ResumeMngDAO{

	@Autowired SqlSessionTemplate sqlSession;
	private String namespace="config.mybatis.mapper.oracle.resumeManager.";
	
	@Override
	public List<Map<String, Object>> resumeByOpenNo(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"resumeByOpenNo",searchVo);
	}

	@Override
	public int rsOpenTotal(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"rsOpenTotal",searchVo);
	}

	@Override
	public int resumreAck(int resumeNo) {
		return sqlSession.update(namespace+"resumreAck",resumeNo);
	}

	@Override
	public int resumreBack(int resumeNo) {
		return sqlSession.update(namespace+"resumreBack",resumeNo);
	}

}
