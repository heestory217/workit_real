package com.it.workit.position.model;

import java.util.List;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface PositionDAO {
	//은별
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(IndivpagingVO vo);
	public int positionGetTotalRecord(IndivpagingVO vo);
}
