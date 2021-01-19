package com.it.workit.message.model;

import java.util.List;

public interface MessageDAO {
	int insertMessage(MessageVO vo);
	List<MessageVO> selectSentMessage(int userNo);
}
