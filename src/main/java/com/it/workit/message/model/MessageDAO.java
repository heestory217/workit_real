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
	
	//중요플래그 업데이트 => 받은메세지 중 보관하고 싶은 쪽지
	int updategetMsgImpflag(int messageNo);
	
	//중요쪽지함 조회
	List<Map<String, Object>> selectImpMessage(int userNo);
	
}
