package com.it.workit.recruitBookmark.model;

import java.util.List;
import java.util.Map;

import com.it.workit.indivMypage.model.IndivpagingVO;

public interface RecruitBookmarkDAO {
	//은별
	//public List<RecruitannouncebookmarkVO> selectRecruitBookmark(int userNo);
	public List<RecruitannouncebookmarkVO> selectRecruitBookmark(IndivpagingVO vo);
	public int rBookMarkGetTotalRecord(IndivpagingVO vo);
	public int deleteBookmarkByRecruitNo(int recruitannouncebookmarkNo);
	public int insertBookmark(Map<String, Object> bookmarkInfo);
	public int selectRecruitBookmarkDupChk(Map<String, Object> bookmarkInfo);
}
