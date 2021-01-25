package com.it.workit.commentRespond.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.question.model.QstnPagingVO;

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
	public List<Map<String, Object>> selectAllComnt(QstnPagingVO vo) {
		return comntRespondDao.selectAllComnt(vo);
	}
	
	//답변 개수
	@Override
	public int getTotalCmt(QstnPagingVO vo) {
		return comntRespondDao.getTotalCmt(vo);
	}
}