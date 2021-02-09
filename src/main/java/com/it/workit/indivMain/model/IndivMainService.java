package com.it.workit.indivMain.model;

import java.util.List;
import java.util.Map;

public interface IndivMainService {
	List<Map<String, Object>> selectByDeadline();	//채용 마감 임박순
	List<Map<String, Object>> selectNesPost();	//신규 채용 공고
	List<Map<String, Object>> selectCustomPost(int userNo);	//회원 맞춤 채용 공고
}
