package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentRespondServiceImpl implements CommentRespondService{
	@Autowired private CommentRespondDAO comntRespondDao;

	//답변 등록
	@Override
	public int insertComnt(CommentRespondVO vo) {
		return comntRespondDao.insertComnt(vo);
	}
	
	//답변 조회
	@Override
	public List<Map<String, Object>> selectAllComnt(int qstnNo) {
		return comntRespondDao.selectAllComnt(qstnNo);
	}
}
