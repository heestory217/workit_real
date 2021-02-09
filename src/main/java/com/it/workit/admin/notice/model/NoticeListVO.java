package com.it.workit.admin.notice.model;

import java.util.List;

public class NoticeListVO {
	private List<NoticeVO> noticeList;

	public List<NoticeVO> getNoticeList() {
		return noticeList;
	}

	public void setNoticeList(List<NoticeVO> noticeList) {
		this.noticeList = noticeList;
	}

	@Override
	public String toString() {
		return "NoticeListVO [noticeList=" + noticeList + "]";
	}
	
}
