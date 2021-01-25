package com.it.workit.commentRespond.model;

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
}
