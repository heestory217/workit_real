package com.it.workit.position.model;

import java.util.List;

public interface PositionDAO {
	//은별
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(int userNo);
}
