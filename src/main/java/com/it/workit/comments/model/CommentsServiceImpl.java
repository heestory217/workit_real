package com.it.workit.comments.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentsServiceImpl implements CommentsService {
	@Autowired private CommentsDAO commentDao;

	@Override
	public int insertReply(CommentsVO vo) {
		return commentDao.insertReply(vo);
	}

	@Override
	public List<CommentsVO> selectComment(int replyNo) {
		return commentDao.selectComment(replyNo);
	}
	
	
}
