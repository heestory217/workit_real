package com.it.workit.faq.model;

import java.util.List;

public interface FaqService {
	public List<FaqVO> faqselectAll();
	public int faqinsert(FaqVO faqVo);
	public FaqVO faqselectByNo(int no);
	public int faqupdate(FaqVO faqVo);
	public int faqdelete(FaqVO faqVo);
}
