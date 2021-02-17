package com.it.workit.qna.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;

public interface QnaService {
	public List<QnaVO> qaseletAll(SearchVO searchVo);
	public int qaTotalRecord(SearchVO searchVo);
	public int qaInsert(QnaVO qaVo);
	public int qaViewCount(int qaNo);
	public QnaUsersVO qaSelectByNo(int qaNo);
	
	public int qaDelete(Map<String, String> map);
	
	public int qaUpdate(QnaUsersVO qauVo);
	
	public String chkPassword(int qaNo);
	
	public int qaReply(QnaUsersVO qauVo);
}
