package com.it.workit.admin.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.common.SearchVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired private NoticeDAO noticeDao;
	
	//공지사항 카테고리 조회
	@Override
	public List<ClassificationsVO> selectClassifications() {
		return noticeDao.selectClassifications();
	}

	//공지사항 전체 조회
	@Override
	public List<Map<String, Object>> selectNoticeAll(SearchVO vo) {
		return noticeDao.selectNoticeAll(vo);
	}
	
	//공지사항 전체 레코드 수
	@Override
	public int getTotalRecord(SearchVO vo) {
		return noticeDao.getTotalRecord(vo);
	}
	
	
}
