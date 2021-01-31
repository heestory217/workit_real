package com.it.workit.indivsearch.model;

import java.util.List;

import com.it.workit.language.model.LanguageVO;

public interface IndivSearchDAO {
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword);
	public List<IndivKeywordSearchVO> selectIndivLanguage(int languageNo);
	public List<LanguageVO> selectLanguage();
}
