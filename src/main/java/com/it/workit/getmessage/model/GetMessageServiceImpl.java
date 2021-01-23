package com.it.workit.getmessage.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GetMessageServiceImpl implements GetMessageService{

	@Autowired private GetMessageDAO getMessageDao;

	@Override
	public int insertGetMessage(GetMessageVO gVo) {
		return getMessageDao.insertGetMessage(gVo);
	}

	@Override
	public int updateReadCount(int messageNo) {
		return getMessageDao.updateReadCount(messageNo);
	}

	//중요플래그 업데이트 => 받은메세지 중 보관하고 싶은 쪽지
	@Override
	public int updategetMsgImpflag(int messageNo) {
		return getMessageDao.updategetMsgImpflag(messageNo);
	}
	
	//보관함 조회
	@Override
	public List<Map<String, Object>> selectImpMessage(int userNo) {
		return getMessageDao.selectImpMessage(userNo);
	}
}
