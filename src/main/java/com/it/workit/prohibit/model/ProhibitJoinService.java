package com.it.workit.prohibit.model;

import java.util.List;
import java.util.Map;

import com.it.workit.applicant.model.CorpApplicantPagingVO;

public interface ProhibitJoinService {
	int insertProhibit (ProhibitJoinVO vo);
	int selectIfProhibited(int userIndivNo);
	
	public List<Map<String, Object>> selectProhibitedList(ProhibitJoinPagingVO vo);
	int deleteFromProhibit(int userIndivNo);
	int selectProhibitTotal(int userCorpNo);
}
