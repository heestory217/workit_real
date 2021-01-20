package com.it.workit.getmessage.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GetMessageServiceImpl implements GetMessageService{

	@Autowired private GetMessageDAO getMessageDao;

	@Override
	public int insertGetMessage(GetMessageVO gVo) {
		return getMessageDao.insertGetMessage(gVo);
	}
}
