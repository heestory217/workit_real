package com.it.workit.faq.model;

import java.util.List;

import com.it.workit.common.SearchVO;

public interface FaqDAO {
	public List<FaqVO> faqselectAll();
	public int faqinsert(FaqVO faqVo);
	public FaqVO faqselectByNo(int no);
	public int faqupdate(FaqVO faqVo);
	public int faqdelete(int faqNo);
	
	//매니저용 
	public List<FaqVO> selectAllMng(SearchVO serchVo);
	public int totalfa(SearchVO serchVo);
}
