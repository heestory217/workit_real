package com.it.workit.getmessage.model;

public interface GetMessageService {
	int insertGetMessage(GetMessageVO gVo);
	int updateReadCount(int messageNo);
}
