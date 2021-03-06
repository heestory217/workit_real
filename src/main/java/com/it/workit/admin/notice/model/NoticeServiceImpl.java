package com.it.workit.admin.notice.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

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
	public List<Map<String, Object>> selectNoticeAll(NoticeSearchVO vo) {
		return noticeDao.selectNoticeAll(vo);
	}
	
	//공지사항 전체 레코드 수
	@Override
	public int getTotalRecord(NoticeSearchVO vo) {
		return noticeDao.getTotalRecord(vo);
	}
	
	//공지사항 삭제
	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDao.deleteNotice(noticeNo);
	}
	
	//공지사항 선택 삭제
	@Override
	@Transactional
	public int multiDelNotice(List<NoticeVO> noticeList) {
		
		int cnt=0;
		try {
			for(NoticeVO vo : noticeList) {
				int noticeNo=vo.getNoticeNo();
				if(noticeNo!=0) {
					cnt=noticeDao.deleteNotice(noticeNo);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
	
	//공지사항 등록
	@Override
	public int insertNotice(NoticeVO vo) {
		return noticeDao.insertNotice(vo);
	}

	//공지사항 조회
	@Override
	public Map<String, Object> selectNoticeByNo(int noticeNo) {
		return noticeDao.selectNoticeByNo(noticeNo);
	}
	
	//공지사항 수정
	@Override
	public int updateNotice(NoticeVO vo) {
		return noticeDao.updateNotice(vo);
	}
	
	//공지사항 조회수 업데이트(회원)
	@Override
	public int viewUpdate(int noticeNo) {
		return noticeDao.viewUpdate(noticeNo);
	}

	//공지사항 전체 조회(회원)
	@Override
	public List<Map<String, Object>> selectAllNotice(NoticeSearchVO vo) {
		return noticeDao.selectAllNotice(vo);
	}
	
	//공지사항 상세조회(회원)
	@Override
	public Map<String, Object> selectNoticeOne(int noticeNo) {
		return noticeDao.selectNoticeOne(noticeNo);
	}

	//전체 레코드수
	@Override
	public int getRecordCount() {
		return noticeDao.getRecordCount();
	}
	
	
}
