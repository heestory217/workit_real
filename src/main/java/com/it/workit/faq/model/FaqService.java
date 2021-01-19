package com.it.workit.faq.model;

import java.util.List;

public interface FaqService {
	public List<FaqVO> faqselectAll();
	public int faqinsert(FaqVO faqVo);
}
