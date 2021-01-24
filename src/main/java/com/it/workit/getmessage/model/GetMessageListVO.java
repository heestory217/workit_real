package com.it.workit.getmessage.model;

import java.util.List;

public class GetMessageListVO {
	private List<GetMessageVO> getMsgItems;

	public List<GetMessageVO> getGetMsgItems() {
		return getMsgItems;
	}

	public void setGetMsgItems(List<GetMessageVO> getMsgItems) {
		this.getMsgItems = getMsgItems;
	}

	@Override
	public String toString() {
		return "GetMessageListVO [getMsgItems=" + getMsgItems + "]";
	}
	
}
