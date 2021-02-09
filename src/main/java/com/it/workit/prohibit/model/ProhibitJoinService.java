package com.it.workit.prohibit.model;

public interface ProhibitJoinService {
	int insertProhibit (ProhibitJoinVO vo);
	int selectIfProhibited(int userIndivNo);
}
