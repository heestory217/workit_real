package com.it.workit.indivsearch.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.language.model.LanguageVO;
import com.it.workit.question.model.WorkkindVO;
import com.it.workit.users.model.arealistVO;

@Repository
public class IndivSearchDAOMybatis implements IndivSearchDAO{
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String namespace="config.mybatis.mapper.oracle.indivSearch.";

	@Override
	public List<IndivKeywordSearchVO> selectIndivKeyword(String keyword) {
		return sqlSession.selectList(namespace+"selectIndivKeyword",keyword);
	}

	@Override
	public List<IndivKeywordSearchVO> selectIndivLanguage(int languageNo) {
		return sqlSession.selectList(namespace+"selectIndivLanguage",languageNo);
	}

	@Override
	public List<LanguageVO> selectLanguage() {
		return sqlSession.selectList(namespace+"selectLanguage");
	}

	@Override
	public List<IndivKeywordSearchVO> selectSearchAll() {
		return sqlSession.selectList(namespace+"selectSearchAll");
	}

	@Override
	public List<IndivKeywordSearchVO> selectExplore(IndivKeywordSearchVO vo) {
		return sqlSession.selectList(namespace+"selectExplore",vo);
	}

	@Override
	public List<arealistVO> selectAreaList() {
		return sqlSession.selectList(namespace+"selectAreaList");
	}

	@Override
	public List<arealistVO> selectAreaList1() {
		return sqlSession.selectList(namespace+"selectAreaList1");
	}

	@Override
	public List<arealistVO> selectAreaList2(String areaAdd1) {
		return sqlSession.selectList(namespace+"selectAreaList2", areaAdd1);
	}

	@Override
	public List<IndivKeywordSearchVO> selectExploreAll(IndivKeywordSearchVO vo) {
		return sqlSession.selectList(namespace+"selectExploreAll",vo);
	}

	@Override
	public List<IndivKeywordSearchVO> selectExploreWorkKind(int workkindNo) {
		return sqlSession.selectList(namespace+"selectExploreWorkKind",workkindNo);
	}

	@Override
	public List<IndivKeywordSearchVO> selectExploreWorkKindAll() {
		return sqlSession.selectList(namespace+"selectExploreWorkKindAll");
	}

	@Override
	public List<WorkkindVO> selectWorkkind() {
		return sqlSession.selectList(namespace+"selectWorkkind");
	}
}
