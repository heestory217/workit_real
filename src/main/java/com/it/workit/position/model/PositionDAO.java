package com.it.workit.position.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface PositionDAO {
	//은별
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(IndivpagingVO vo);
	public int positionGetTotalRecord(IndivpagingVO vo);
	
	//희정
	int insertPositionSuggest(PositionsuggestVO vo);
	PositionsuggestVO selectPositionJustNow(int userNo);
	
	//포지션제안함 조회 (기업)
	List<Map<String, Object>> selectPositionSuggest(int userNo);
	List<Map<String, Object>> selectPositionForm(int userNo);
	Map<String, Object> selectByPositionNo(int positionsuggestNo);
	
	//삭제
	int deletePSG(int positionsuggestNo);
	
}
