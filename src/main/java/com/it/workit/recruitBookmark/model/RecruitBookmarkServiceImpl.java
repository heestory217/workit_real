package com.it.workit.recruitBookmark.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it.workit.indivMypage.model.IndivpagingVO;

@Service
public class RecruitBookmarkServiceImpl implements RecruitBookmarkService{
	@Autowired RecruitBookmarkDAO recruitBookmarkDao;

	@Override
	public List<RecruitannouncebookmarkVO> selectRecruitBookmark(IndivpagingVO vo) {
		return recruitBookmarkDao.selectRecruitBookmark(vo);
	}

	@Override
	public int deleteBookmarkByRecruitNo(int recruitannouncebookmarkNo) {
		return recruitBookmarkDao.deleteBookmarkByRecruitNo(recruitannouncebookmarkNo);
	}

	@Override
	public int rBookMarkGetTotalRecord(IndivpagingVO vo) {
		return recruitBookmarkDao.rBookMarkGetTotalRecord(vo);
	}
}
