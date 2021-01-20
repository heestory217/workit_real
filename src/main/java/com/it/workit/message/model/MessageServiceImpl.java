package com.it.workit.message.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService{
	
	@Autowired private MessageDAO messageDao;

	@Override
	public int insertMessage(MessageVO vo) {
		return messageDao.insertMessage(vo);
	}

	@Override
	public List<MessageVO> selectSentMessage(int userNo) {
		return messageDao.selectSentMessage(userNo);
	}

	@Override
	public MessageVO selectByMessageNo(int messageNo) {
		return messageDao.selectByMessageNo(messageNo);
	}

}
