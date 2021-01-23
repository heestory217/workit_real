package com.it.workit.getmessage.model;

import java.util.List;
import java.util.Map;

public interface GetMessageDAO {
	//받은 쪽지함
	int insertGetMessage(GetMessageVO gVo);
	
	//읽음 처리
	int updateReadCount(int messageNo);
	
	//중요플래그 업데이트 => 받은메세지 중 보관하고 싶은 쪽지
	int updategetMsgImpflag(int messageNo);
	
	//중요쪽지함 조회
	List<Map<String, Object>> selectImpMessage(int userNo);
}
