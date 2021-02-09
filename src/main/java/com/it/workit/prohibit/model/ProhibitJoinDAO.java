package com.it.workit.prohibit.model;

public interface ProhibitJoinDAO {
	int insertProhibit (ProhibitJoinVO vo);
	int selectIfProhibited(int userIndivNo);
}
