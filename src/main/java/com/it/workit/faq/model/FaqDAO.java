package com.it.workit.faq.model;

import java.util.List;

public interface FaqDAO {
	public List<FaqVO> faqselectAll();
	public int faqinsert(FaqVO faqVo);
}
