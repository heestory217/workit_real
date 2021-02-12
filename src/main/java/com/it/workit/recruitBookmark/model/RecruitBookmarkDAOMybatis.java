package com.it.workit.recruitBookmark.model;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Repository
public class RecruitBookmarkDAOMybatis implements RecruitBookmarkDAO{

	@Autowired SqlSession sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.recruitBookmark.";
	
//	@Override
//	public List<RecruitannouncebookmarkVO> selectRecruitBookmark(int userNo) {
//		return sqlSession.selectList(namespace+"selectRecruitBookmark",userNo);
//	}
	@Override
	public List<RecruitannouncebookmarkVO> selectRecruitBookmark(IndivpagingVO vo) {
		return sqlSession.selectList(namespace+"selectRecruitBookmark",vo);
	}

	@Override
	public int deleteBookmarkByRecruitNo(int recruitannouncebookmarkNo) {
		return sqlSession.delete(namespace+"deleteBookmarkByRecruitNo",recruitannouncebookmarkNo);
	}

	@Override
	public int rBookMarkGetTotalRecord(IndivpagingVO vo) {
		return sqlSession.selectOne(namespace+"rBookMarkGetTotalRecord",vo);
	}

	@Override
	public int insertBookmark(Map<String, Object> bookmarkInfo) {
		return sqlSession.insert(namespace+"insertBookmark",bookmarkInfo);
	}

	@Override
	public int selectRecruitBookmarkDupChk(Map<String, Object> bookmarkInfo) {
		return sqlSession.selectOne(namespace+"selectRecruitBookmarkDupChk", bookmarkInfo);
	}
}
