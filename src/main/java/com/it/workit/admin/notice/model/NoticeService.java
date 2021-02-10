package com.it.workit.admin.notice.model;

import java.util.List;
import java.util.Map;

import com.it.workit.common.SearchVO;

public interface NoticeService {
	List<ClassificationsVO> selectClassifications();	//공지사항 카테고리 조회
	List<Map<String, Object>> selectNoticeAll(SearchVO vo);	//공지사항 전체 조회
	int getTotalRecord(SearchVO vo);	//공지사항 전체 레코드 수
	int insertNotice(NoticeVO vo);		//공지사항 등록
	Map<String, Object> selectNoticeByNo(int noticeNo);	//공지사항  조회
	int updateNotice(NoticeVO vo);	//공지사항 수정
	int deleteNotice(int noticeNo);		//공지사항 삭제
	int multiDelNotice(List<NoticeVO> noticeList);	//공지사항 선택 삭제
}
