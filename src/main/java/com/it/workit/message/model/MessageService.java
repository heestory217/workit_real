package com.it.workit.message.model;

import java.util.List;
import java.util.Map;

public interface MessageService {
	int insertMessage(MessageVO vo);
	//내가 보낸 쪽지
	List<Map<String, Object>> selectSentMessage(int userNo);
	
	//나에게 보낸 쪽지 (받은 쪽지)
	List<Map<String, Object>> selectSentMyself(int userNo);
	
	//다른사람에게 받은 쪽지
	List<Map<String, Object>> selectGetMessage(int userNo);
	
	//쪽지함 조회
	Map<String, Object> selectByMessageNo(int messageNo);
	
	//삭제플래그 업데이트 => 보낸 메세지 삭제
	int updateMsgDelflag(int messageNo);
	
	//삭제플래그 업데이트 => 받은 메세지 삭제
	int updategetMsgDelflag(int messageNo);

}
