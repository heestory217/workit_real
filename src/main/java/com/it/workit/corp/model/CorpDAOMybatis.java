package com.it.workit.corp.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;
import com.it.workit.corpsearch.model.MatchSearchVO;

@Repository
public class CorpDAOMybatis implements CorpDAO {
	@Autowired SqlSession sqlSession;
	
	private String namespace="com.mybatis.mapper.corp.";
	
	public int insertCorp(CorpVO vo) {
		return sqlSession.insert(namespace+"insertCorp", vo);
	}

	public int insertImg(CorpimgVO vo) {
		return sqlSession.update(namespace+"insertImg", vo);
	}
	
	public CorpVO selectCorp(int corpNo) {
		return sqlSession.selectOne(namespace+"selectCorp", corpNo);
	}
	
	public List<CorpimgVO> corpImgList (int corpNo) {
		return sqlSession.selectList(namespace+"corpImgList", corpNo);
	}

	@Override
	public List<CorpRecruitViewVO> selectRecruit(int corpNo) {
		return sqlSession.selectList(namespace+"selectRecruit", corpNo);
	}

	@Override
	public int editCorp(CorpVO vo) {
		return sqlSession.update(namespace+"editCorp",vo);
	}

	@Override
	public int editCorpImg(CorpimgVO vo) {
		return sqlSession.update(namespace+"editCorpImg",vo);
	}

	@Override
	public int selectCorpNo(int userNo) {
		return sqlSession.selectOne(namespace+"selectCorpNo", userNo);
	}

	@Override
	public List<Map<String, Object>> selectRecruitList(int userNo) {
		return sqlSession.selectList(namespace+"selectRecruitList", userNo);
	}

	@Override
	public List<AppResumeUserAllVO> selectResumeView(int recruitannounceNo) {
		return sqlSession.selectList(namespace+"AppResumeUserList", recruitannounceNo);
	}

	@Override
	public List<AreaListView> selectAreaList(int resumeNo) {
		return sqlSession.selectList(namespace+"areaList", resumeNo);
	}

	@Override
	public List<LanguageListView> selectLanguageList(int resumeNo) {
		return sqlSession.selectList(namespace+"langList",resumeNo);
	}

	@Override
	public List<Integer> selectResumeNoList(MatchSearchVO matchSearchVO) {
		return sqlSession.selectList(namespace+"selectResumeNoList", matchSearchVO);
	}

	@Override
	public int insertCorpReview(CorpreviewVO vo) {
		return sqlSession.insert(namespace+"insertCorpReview",vo);
	}

	
	//admin
	@Override
	public List<CorpVO> selectCorpList(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectCorpList", searchVo);
	}

	@Override
	public int selectCorpListCount(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectCorpListCount", searchVo);
	}

	@Override
	public List<CorpAllVo> selectCorpWaitingList() {
		return sqlSession.selectList(namespace+"selectCorpWaitingList");
	}

	@Override
	public List<CorpimgVO> selectCorpWaitingImgList(int corpNo) {
		return sqlSession.selectList(namespace+"selectCorpWaitingImgList",corpNo);
	}

	@Override
	public int corpOkCheck(String corpNo) {
		return sqlSession.update(namespace+"corpOkCheck", corpNo);
	}

	@Override
	public int corpReject(String corpNo) {
		return sqlSession.update(namespace+"corpReject", corpNo);
	}

	@Override
	public int corpWaiting(String corpNo) {
		return sqlSession.update(namespace+"corpWaiting", corpNo);
	}



}
