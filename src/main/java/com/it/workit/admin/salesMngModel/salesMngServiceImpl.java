package com.it.workit.admin.salesMngModel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class salesMngServiceImpl implements salesMngService {
	@Autowired salesMngDAO salesDao;

	@Override
	public List<Map<String, Object>> selectMonthSales(String year) {
		salesDateVO vo = new salesDateVO();
		vo.setStartDate(year+"0101");
		vo.setEndDate(year+"1231");
		System.out.println(vo);
		
		return salesDao.selectMonthSales(vo);
	}
	
}
