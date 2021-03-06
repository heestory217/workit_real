package com.it.workit.indivMain.model;

import java.util.List;
import java.util.Map;

public interface IndivMainDAO {
	List<Map<String, Object>> selectByDeadline();	//채용 마감 임박순
	List<Map<String, Object>> selectNesPost();	//신규 채용 공고
	List<Map<String, Object>> selectCustomPost(int userNo);	//회원 맞춤 채용 공고
	List<Map<String, Object>> selectFirClassAd();	//1급 광고 구매 회사 채용 공고
	List<Map<String, Object>> selectSecClassAd();	//2급 광고 구매 회사 채용 공고
}
