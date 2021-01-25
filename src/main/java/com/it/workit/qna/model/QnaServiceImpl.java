package com.it.workit.qna.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.common.SearchVO;

@Service
public class QnaServiceImpl implements QnaService{

	@Autowired private QnaDAO qaDao;

	@Override
	public List<QnaVO> qaseletAll(SearchVO searchVo) {
		return qaDao.qaseletAll(searchVo);
	}

	@Override
	public int qaTotalRecord(SearchVO searchVo) {
		return qaDao.qaTotalRecord(searchVo);
	}

	@Override
	public int qaInsert(QnaVO qaVo) {
		return qaDao.qaInsert(qaVo);
	}

	@Override
	public int qaViewCount(int qaNo) {
		return qaDao.qaViewCount(qaNo);
	}
	
	
}
