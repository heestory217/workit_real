package com.it.workit.message.model;

import java.util.List;
import java.util.Map;

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
	public List<Map<String, Object>> selectSentMessage(int userNo) {
		return messageDao.selectSentMessage(userNo);
	}
	
	@Override
	public List<Map<String, Object>> selectSentMyself(int userNo) {
		return messageDao.selectSentMyself(userNo);
	}

	@Override
	public List<Map<String, Object>> selectGetMessage(int userNo) {
		return messageDao.selectGetMessage(userNo);
	}
	
	@Override
	public Map<String, Object> selectByMessageNo(int messageNo) {
		return messageDao.selectByMessageNo(messageNo);
	}

	//보낸 메세지 삭제 (플래그 업데이트)
	@Override
	public int updateMsgDelflag(int messageNo) {
		return messageDao.updateMsgDelflag(messageNo);
	}
	
	//받은 메세지 삭제 (플래그 업데이트)
	@Override
	public int updategetMsgDelflag(int messageNo) {
		return messageDao.updategetMsgDelflag(messageNo);
	}

}
