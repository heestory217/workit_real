package com.it.workit.message.model;

import java.util.List;

public class MessageListVO {
	private List<MessageVO> msgItems;

	public List<MessageVO> getMsgItems() {
		return msgItems;
	}

	public void setMsgItems(List<MessageVO> msgItems) {
		this.msgItems = msgItems;
	}

	@Override
	public String toString() {
		return "MessageListVO [msgItems=" + msgItems + "]";
	}

}
