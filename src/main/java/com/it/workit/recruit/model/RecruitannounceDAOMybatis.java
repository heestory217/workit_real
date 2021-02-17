package com.it.workit.recruit.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.common.SearchVO;
import com.it.workit.language.model.LanguageVO;
import com.it.workit.users.model.arealistVO;

@Repository
public class RecruitannounceDAOMybatis implements RecruitannounceDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	private String namespace="config.mybatis.mapper.oracle.recruitannounce.";

	@Override
	public RecruitannounceVO recruitannounceselectByNo(int recruitannounceNo) {
		RecruitannounceVO vo = sqlSession.selectOne(namespace+"recruitannouncedetail", recruitannounceNo);
		return vo;
	}

	@Override
	public String recruitcorpwantwork(int recruitannounceNo) {
		String rc= sqlSession.selectOne(namespace+"recruitcorpwantwork", recruitannounceNo);
		return rc;
	}

	@Override
	public String recruitcorpwantedarea(int recruitannounceNo) {
		String vo= sqlSession.selectOne(namespace+"recruitcorpwantedarea1", recruitannounceNo)+" "+sqlSession.selectOne(namespace+"recruitcorpwantedarea2", recruitannounceNo);
		return vo;
	}

	@Override
	public String recruitcorpwantedlang(int recruitannounceNo) {
		String rc= sqlSession.selectOne(namespace+"recruitcorpwantedlanguage", recruitannounceNo);
		return rc;
	}
	
	@Override
	public List<RecruitannounceVO> selectRecruitList(int userNo) {
			return sqlSession.selectList(namespace+"selectRecruitList", userNo);
	}
	
	@Override
	public List<RecruitannounceVO> selectAllRecruitList(int userNo) {
		return sqlSession.selectList(namespace+"selectAllRecruitList", userNo);
	}

	@Override
	public int recruitdelete(int recruitannounceNo) {
		return sqlSession.delete(namespace+"recruitdelete", recruitannounceNo);
	}

	@Override
	public List<LanguageVO> selectcwlanguage() {
		return sqlSession.selectList(namespace+"selectcwlanguage");
	}

	@Override
	public List<arealistVO> selectcwplace() {
		return sqlSession.selectList(namespace+"selectcwplace");
	}

	@Override
	public int recruitannouncewrite(RecruitannounceVO vo) {
		return sqlSession.insert(namespace+"recruitannouncewrite", vo);
	}

	@Override
	public int recruitannounceedit(RecruitannounceVO vo) {
		return sqlSession.update(namespace+"recruitannounceedit", vo);
	}

	@Override
	public List<AdvertisingVO> selectRecruitadList(AdvertisingVO vo) {
		return sqlSession.selectList(namespace+"selectRecruitadList", vo);
	}

	@Override
	public int selectadvercount(int recruitannounceNo) {
		return sqlSession.selectOne(namespace+"selectadvercount", recruitannounceNo);
	}

	@Override
	public AdvertisingVO selectadverinfo(int recruitannounceNo) {
		return sqlSession.selectOne(namespace+"selectadverinfo", recruitannounceNo);
	}

	@Override
	public int recruitannouncecount(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"recruitannouncecount", searchVo);
	}

	@Override
	public List<RecruitannounceVO> recruitannounceall(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"recruitannounceall", searchVo);
	}

	@Override
	public int recruitGetTotalRecord(AdvertisingVO vo) {
		return sqlSession.selectOne(namespace+"recruitGetTotalRecord", vo);
	}

	@Override
	public int recruitannouncerollback(int recruitannounceNo) {
		return sqlSession.insert(namespace+"recruitannouncerollback", recruitannounceNo);
	}

	@Override
	public int recruitannounceallowed(int recruitannounceNo) {
		return sqlSession.insert(namespace+"recruitannounceallowed", recruitannounceNo);
	}

	@Override
	public int recruitannouncedeny(int recruitannounceNo) {
		return sqlSession.insert(namespace+"recruitannouncedeny", recruitannounceNo);
	}
	
	@Override
	public List<AdminadvertisingVO> selectadvertisingfstclass() {
		return sqlSession.selectList(namespace+"selectadvertisingfstclass");
	}
	
	@Override
	public List<AdminadvertisingVO> selectadvertisingsecclass() {
		return sqlSession.selectList(namespace+"selectadvertisingsecclass");
	}

	@Override
	public int selectadvertisingcountfst() {
		return sqlSession.selectOne(namespace+"selectadvertisingcountfst");
	}
	
	@Override
	public int selectadvertisingcountsec() {
		return sqlSession.selectOne(namespace+"selectadvertisingcountsec");
	}

	@Override
	public List<AdminadvertisingVO> selectadvertisinglist(SearchVO searchVo) {
		return sqlSession.selectList(namespace+"selectadvertisinglist", searchVo);
	}

	@Override
	public int selectadvertisinglistcount(SearchVO searchVo) {
		return sqlSession.selectOne(namespace+"selectadvertisinglistcount", searchVo);
	}

}
