package com.it.workit.position.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface PositionService {
	//은별
	public List<PositionsuggestVO> selectPositionFlag2ByUserno(IndivpagingVO vo);
	public int positionGetTotalRecord(IndivpagingVO vo);
	
	//희정
	int insertPositionSuggest(PositionsuggestVO vo, int getUserNo);
	
	//포지션제안 페이지 조회 (기업)
	List<Map<String, Object>> selectPositionSuggest(int userNo);
	List<Map<String, Object>> selectPositionForm(int userNo);
	//상세
	Map<String, Object> selectByPositionNo(int positionsuggestNo);

}
