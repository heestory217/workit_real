package com.it.workit.position.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Service
public class PositionServiceImpl implements PositionService {
	@Autowired
	private PositionDAO positionDao;

	@Override
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(IndivpagingVO vo) {
		return positionDao.selectPositionFlag2ByUserno(vo);
	}

	@Override
	public int positionGetTotalRecord(IndivpagingVO vo) {
		return positionDao.positionGetTotalRecord(vo);
	}
}
