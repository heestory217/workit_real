package com.it.workit.admin.notice.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;

public interface NoticeDAO {
	List<ClassificationsVO> selectClassifications();	//공지사항 카테고리 조회
	List<Map<String, Object>> selectNoticeAll(SearchVO vo);	//공지사항 전체 조회
	int getTotalRecord(SearchVO vo);	//공지사항 전체 레코드 수
	int deleteNotice(int noticeNo);		//공지사항 삭제
}
