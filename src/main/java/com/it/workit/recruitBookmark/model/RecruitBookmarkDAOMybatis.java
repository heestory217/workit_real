package com.it.workit.recruitBookmark.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RecruitBookmarkDAOMybatis implements RecruitBookmarkDAO{

	@Autowired SqlSession sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.recruitBookmark.";
	
	@Override
	public List<RecruitannouncebookmarkVO> selectRecruitBookmark(int userNo) {
		return sqlSession.selectList(namespace+"selectRecruitBookmark",userNo);
	}

	@Override
	public int deleteBookmarkByRecruitNo(int recruitannouncebookmarkNo) {
		return sqlSession.delete(namespace+"deleteBookmarkByRecruitNo",recruitannouncebookmarkNo);
	}
}
