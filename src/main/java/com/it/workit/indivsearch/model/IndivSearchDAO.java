package com.it.workit.indivsearch.model;

import java.util.List;

import com.it.workit.language.model.LanguageVO;
import com.it.workit.users.model.arealistVO;

public interface IndivSearchDAO {
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword);
	public List<IndivKeywordSearchVO> selectIndivLanguage(int languageNo);
	public List<IndivKeywordSearchVO> selectExplore(IndivKeywordSearchVO vo);
	public List<IndivKeywordSearchVO> selectExploreAll(IndivKeywordSearchVO vo);
	public List<LanguageVO> selectLanguage();
	public List<arealistVO> selectAreaList();
	public List<arealistVO> selectAreaList1();
	public List<arealistVO> selectAreaList2(String areaAdd1);
	public List<IndivKeywordSearchVO> selectSearchAll();
}
