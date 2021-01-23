package com.it.workit.getmessage.model;

import java.util.List;
import java.util.Map;

public interface GetMessageService {
	int insertGetMessage(GetMessageVO gVo);
	int updateReadCount(int messageNo);
	
	//중요플래그 업데이트 => 받은메세지 중 보관하고 싶은 쪽지
	int updategetMsgImpflag(int messageNo);
	
	//보관함 조회
	List<Map<String, Object>> selectImpMessage(int userNo);
}
