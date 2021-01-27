package com.it.workit.position.model;

import java.util.List;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface PositionService {
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(IndivpagingVO vo);
	public int positionGetTotalRecord(IndivpagingVO vo);
}
