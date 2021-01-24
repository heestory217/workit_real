package com.it.workit.recruitBookmark.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecruitBookmarkServiceImpl implements RecruitBookmarkService{
	@Autowired RecruitBookmarkDAO recruitBookmarkDao;

	@Override
	public List<RecruitannouncebookmarkVO> selectRecruitBookmark() {
		return recruitBookmarkDao.selectRecruitBookmark();
	}
}
