package com.it.workit.getmessage.model;

import java.util.List;
import java.util.Map;

import com.it.workit.message.model.MessageVO;

public interface GetMessageService {
	int insertGetMessage(GetMessageVO gVo);
	int updateReadCount(int messageNo);
	
	//중요플래그 업데이트 
	//=> 받은메세지 중 보관하고 싶은 쪽지(개별/다중)
	int updategetMsgImpflag(int messageNo);
	int updategetMsgImpflagMulti(List<GetMessageVO> getMsgList);
	
	//보관함 조회
	List<Map<String, Object>> selectImpMessage(int userNo);
	
	//삭제플래그 업데이트 => 받은 메세지 삭제(개별/다중)
	int updategetMsgDelflag(int getMessageNo);
	int updategetMsgDelflag(List<GetMessageVO> getMsgList);
}
