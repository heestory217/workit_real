package com.it.workit.admin.salesMngModel;

import java.util.List;
import java.util.Map;

public interface salesMngDAO {
	//전체 매출
	List<Map<String, Object>> selectMonthSales(salesDateVO vo);

	//서비스별
	List<Map<String, Object>> selectReviewSales(salesDateVO vo);
	List<Map<String, Object>> selectAdSales(salesDateVO vo);
	List<Map<String, Object>> selectDelSales(salesDateVO vo);
	List<Map<String, Object>> selectResumeSales(salesDateVO vo);

	List<Map<String, Object>> selectServicePie();

}
