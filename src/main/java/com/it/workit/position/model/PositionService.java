package com.it.workit.position.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;
import com.it.workit.message.model.MessageVO;

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
	
	//삭제플래그 업데이트 => 보낸 제안 삭제 (개별/다중)
	int deletePSG(int positionsuggestNo);
	int deleteMultiPosi(List<PositionsuggestVO> posiList);
	
	//양식 수정
	int updatePSGForm(PositionsuggestVO vo);

}
