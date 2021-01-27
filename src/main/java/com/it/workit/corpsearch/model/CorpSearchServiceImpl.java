package com.it.workit.corpsearch.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CorpSearchServiceImpl implements CorpSearchService{
	@Autowired private CorpSearchDAO dao;

}
