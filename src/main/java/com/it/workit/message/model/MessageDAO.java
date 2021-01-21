package com.it.workit.message.model;

import java.util.List;
import java.util.Map;

public interface MessageDAO {
	int insertMessage(MessageVO vo);
	List<Map<String, Object>> selectSentMessage(int userNo);
	List<Map<String, Object>> selectSentMyself(int userNo);
	List<Map<String, Object>> selectGetMessage(int userNo);
	Map<String, Object> selectByMessageNo(int messageNo);
	
	//삭제플래그 업데이트 => 보낸 메세지 삭제
	int updateMsgDelflag(int messageNo);
	
	//삭제플래그 업데이트 => 받은 메세지 삭제
	int updategetMsgDelflag(int messageNo);
}
