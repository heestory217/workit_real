package com.it.workit.qna.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public interface QnaService {
	//리스트에서 글 확인시 사용됨
	public static final int PASS_OK=1;//비밀번호 맞음
	public static final int PASS_DISAGREE=2;//비밀번호오류
	
	public List<QnaVO> qaseletAll(SearchVO searchVo);
	public int qaTotalRecord(SearchVO searchVo);
	public int qaInsert(QnaVO qaVo);
	public int qaViewCount(int qaNo);
	public QnaUsersVO qaSelectByNo(int qaNo);
	
	public int qaDelete(int qaNo);
}
