package com.it.workit.message.model;

import java.util.List;
import java.util.Map;

public interface MessageService {
	int insertMessage(MessageVO vo);
	List<Map<String, Object>> selectSentMessage(int userNo);
	List<Map<String, Object>> selectSentMyself(int userNo);
	List<Map<String, Object>> selectGetMessage(int userNo);
	Map<String, Object> selectByMessageNo(int messageNo);
}
