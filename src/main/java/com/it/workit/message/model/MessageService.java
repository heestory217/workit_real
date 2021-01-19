package com.it.workit.message.model;

import java.util.List;

public interface MessageService {
	int insertMessage(MessageVO vo);
	List<MessageVO> selectSentMessage(int userNo);
}
