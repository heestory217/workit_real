package com.it.workit.admin.salesMngModel;

import java.util.List;
import java.util.Map;

public interface salesMngService {

	List<Map<String, Object>> selectMonthSales(String year);

}
