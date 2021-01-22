package com.it.workit.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int faqdelete(FaqVO faqVo) {
		return faqDao.faqdelete(faqVo);
	}
}
