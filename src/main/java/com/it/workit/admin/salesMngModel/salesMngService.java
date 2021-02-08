package com.it.workit.admin.salesMngModel;

import java.util.List;
import java.util.Map;

public interface salesMngService {
	//전체 매출
	List<Map<String, Object>> selectMonthSales(String year);
	
	//서비스별
	List<Map<String, Object>> selectReviewSales(String year);
	List<Map<String, Object>> selectAdSales(String year);
	List<Map<String, Object>> selectDelSales(String year);
	List<Map<String, Object>> selectResumeSales(String year);

}
