package com.it.workit.recruitBookmark.model;

import java.util.List;

public interface RecruitBookmarkDAO {
	//은별
	public List<RecruitannouncebookmarkVO> selectRecruitBookmark(int userNo);
	public int deleteBookmarkByRecruitNo(int recruitannouncebookmarkNo);
}
