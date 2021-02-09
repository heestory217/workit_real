package com.it.workit.prohibit.model;

import java.util.List;
import java.util.Map;

import com.it.workit.applicant.model.CorpApplicantPagingVO;

public interface ProhibitJoinDAO {
	int insertProhibit (ProhibitJoinVO vo);
	int selectIfProhibited(int userIndivNo);
	
	int selectProhibitCount(CorpApplicantPagingVO vo);
	public List<Map<String, Object>> selectProhibitedList(ProhibitJoinPagingVO vo);
	int deleteFromProhibit(int prohibitjoinNo);
	int selectProhibitTotal(int userCorpNo);
	
}
