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

	//중요플래그 업데이트 => 받은메세지 중 보관하고 싶은 쪽지
	@Override
	public int updategetMsgImpflag(int messageNo) {
		return messageDao.updategetMsgImpflag(messageNo);
	}
	
	//보관함 조회
	@Override
	public List<Map<String, Object>> selectImpMessage(int userNo) {
		return messageDao.selectImpMessage(userNo);
	}

}
