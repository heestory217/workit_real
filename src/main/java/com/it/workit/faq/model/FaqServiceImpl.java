package com.it.workit.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;

import com.it.workit.admin.notice.model.NoticeVO;
import com.it.workit.common.SearchVO;

@Service
public class FaqServiceImpl implements FaqService{
	
	@Autowired
	private FaqDAO faqDao;

	@Override
	public List<FaqVO> faqselectAll() {
		List<FaqVO> list = faqDao.faqselectAll();
		return list;
	}

	@Override
	public int faqinsert(FaqVO faqVo) {
		return faqDao.faqinsert(faqVo);
	}

	@Override
	public FaqVO faqselectByNo(int no) {
		return faqDao.faqselectByNo(no);
	}

	@Override
	public int faqupdate(FaqVO faqVo) {
		return faqDao.faqupdate(faqVo);
	}

	@Override
	public int faqdelete(int faqNo) {
		return faqDao.faqdelete(faqNo);
	}

	@Override
	public List<FaqVO> selectAllMng(SearchVO serchVo) {
		return faqDao.selectAllMng(serchVo);
	}

	@Override
	public int totalfa(SearchVO serchVo) {
		return faqDao.totalfa(serchVo);
	}

	@Override
	@Transactional
	public int multiDel(List<FaqVO> flist) {
		int cnt=0;
		try {
			for(FaqVO vo : flist) {
				int faqNo = vo.getFaqNo();
				if(faqNo!=0) {
					cnt=faqDao.faqdelete(faqNo);
				}
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			cnt=-1;
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}
		return cnt;
	}
}
