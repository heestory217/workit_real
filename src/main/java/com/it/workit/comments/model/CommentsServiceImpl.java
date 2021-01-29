package com.it.workit.comments.model;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> selectComment(int cmntNo) {
		return commentDao.selectComment(cmntNo);
	}

	@Override
	public int updateReply(CommentsVO vo) {
		return commentDao.updateReply(vo);
	}

	@Override
	public int deleteReply(int replyNo) {
		return commentDao.deleteReply(replyNo);
	}

	@Override
	public int selectReplyCnt(int commentNo) {
		return commentDao.selectReplyCnt(commentNo);
	}
	
	
}
