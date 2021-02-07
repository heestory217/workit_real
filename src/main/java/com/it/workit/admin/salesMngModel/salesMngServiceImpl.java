package com.it.workit.admin.salesMngModel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class salesMngServiceImpl implements salesMngService {
	@Autowired salesMngDAO salesDao;

	@Override
	public List<Map<String, Object>> selectMonthSales() {
		return salesDao.selectMonthSales();
	}
	
}
