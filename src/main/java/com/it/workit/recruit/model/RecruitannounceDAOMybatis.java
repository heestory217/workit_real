package com.it.workit.recruit.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public int recruitdelete(int recruitannounceNo) {
		return sqlSession.delete(namespace+"recruitdelete", recruitannounceNo);
	}

	@Override
	public List<String> selectcwlanguage() {
		return sqlSession.selectList(namespace+"selectcwlanguage");
	}

	@Override
	public List<arealistVO> selectcwplace() {
		return sqlSession.selectList(namespace+"selectcwplace");
	}

	@Override
	public int recruitannouncewrite(RecruitannounceVO vo) {
		return 0;//sqlSession.insert(namespace+"recruitannouncewrite", vo);
	}

}
