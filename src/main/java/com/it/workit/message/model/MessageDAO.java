package com.it.workit.message.model;

import java.util.List;
import java.util.Map;

import com.it.workit.getmessage.model.GetMessageVO;

public interface MessageDAO {
	//메세지 보내기
	int insertMessage(MessageVO vo);
	
	//받은 메세지 뷰 조회
	List<Map<String, Object>> selectGetMessage(int userNo);

	//보낸 메세지 뷰 조회
	List<Map<String, Object>> selectSentMessage(int userNo);
	
	//나에게 보낸 메세지 뷰 조회
	List<Map<String, Object>> selectSentMyself(int userNo);
	
	//뷰에서 메세지 번호로 조회
	Map<String, Object> selectByMessageNo(int messageNo);
	
	//삭제플래그 업데이트 => 보낸 메세지 삭제
	int updateMsgDelflag(int messageNo);
	
	//삭제플래그 업데이트 => 받은 메세지 삭제
	int updategetMsgDelflag(int messageNo);
}
