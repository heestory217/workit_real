package com.it.workit.admin.salesMngModel;

import java.util.List;
import java.util.Map;

public interface salesMngDAO {

	List<Map<String, Object>> selectMonthSales(salesDateVO vo);

}
