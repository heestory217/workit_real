package com.it.workit.getmessage.model;

public interface GetMessageDAO {
	int insertGetMessage(GetMessageVO gVo);
	int updateReadCount(int messageNo);
}
