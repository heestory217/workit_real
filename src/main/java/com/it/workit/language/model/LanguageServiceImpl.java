package com.it.workit.language.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LanguageServiceImpl implements LanguageService{
	@Autowired private LanguageDAO languageDao;

	@Override
	public List<LanguageVO> selectAllLang() {
		return languageDao.selectAllLang();
	}
	
}
