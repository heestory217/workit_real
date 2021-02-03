package com.it.workit.indivsearch.model;

import java.util.List;

import com.it.workit.language.model.LanguageVO;
import com.it.workit.question.model.WorkkindVO;
import com.it.workit.users.model.arealistVO;

public interface IndivSearchService {
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword);
	public List<IndivKeywordSearchVO> selectIndivLanguage(int languageNo);
	public List<LanguageVO> selectLanguage();
	public List<IndivKeywordSearchVO> selectSearchAll();
	public List<IndivKeywordSearchVO> selectExplore(IndivKeywordSearchVO vo);
	public List<IndivKeywordSearchVO> selectExploreAll(IndivKeywordSearchVO vo);
	public List<arealistVO> selectAreaList();
	public List<arealistVO> selectAreaList1();
	public List<arealistVO> selectAreaList2(String areaAdd1);
	public List<IndivKeywordSearchVO> selectExploreWorkKind(int workkindNo);
	public List<IndivKeywordSearchVO> selectExploreWorkKindAll();
	public List<WorkkindVO> selectWorkkind();
}
