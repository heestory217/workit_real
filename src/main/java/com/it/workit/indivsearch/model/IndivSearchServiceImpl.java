package com.it.workit.indivsearch.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.language.model.LanguageVO;

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
}
