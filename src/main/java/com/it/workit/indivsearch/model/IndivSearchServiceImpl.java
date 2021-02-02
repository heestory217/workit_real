package com.it.workit.indivsearch.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.language.model.LanguageVO;
import com.it.workit.users.model.arealistVO;

@Service
public class IndivSearchServiceImpl implements IndivSearchService{
	@Autowired
	private IndivSearchDAO indivSearchDao;

	@Override
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword) {
		return indivSearchDao.selectIndivKeyword(keyword);
	}

	@Override
	public List<IndivKeywordSearchVO> selectIndivLanguage(int languageNo) {
		return indivSearchDao.selectIndivLanguage(languageNo);
	}

	@Override
	public List<LanguageVO> selectLanguage() {
		return indivSearchDao.selectLanguage();
	}

	@Override
	public List<IndivKeywordSearchVO> selectSearchAll() {
		return indivSearchDao.selectSearchAll();
	}

	@Override
	public List<IndivKeywordSearchVO> selectExplore(IndivKeywordSearchVO vo) {
		return indivSearchDao.selectExplore(vo);
	}

	@Override
	public List<arealistVO> selectAreaList() {
		return indivSearchDao.selectAreaList();
	}

	@Override
	public List<arealistVO> selectAreaList1() {
		return indivSearchDao.selectAreaList1();
	}

	@Override
	public List<arealistVO> selectAreaList2(String areaAdd1) {
		return indivSearchDao.selectAreaList2(areaAdd1);
	}

	@Override
	public List<IndivKeywordSearchVO> selectExploreAll(IndivKeywordSearchVO vo) {
		return indivSearchDao.selectExploreAll(vo);
	}
}
