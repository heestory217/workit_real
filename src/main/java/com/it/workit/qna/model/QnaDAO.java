package com.it.workit.qna.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public interface QnaDAO {
	public List<QnaVO> qaseletAll(SearchVO searchVo);
	public int qaTotalRecord(SearchVO searchVo);
	public int qaInsert(QnaVO qaVo);
	public int qaViewCount(int qaNo);
	public QnaUsersVO qaSelectByNo(int qaNo);
	
	public int qaDelete(int qaNo);
}
