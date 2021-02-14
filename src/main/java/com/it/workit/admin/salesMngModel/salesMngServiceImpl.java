package com.it.workit.admin.salesMngModel;

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
		System.out.println("salesDateVO="+vo);
		return salesDao.selectMonthSales(vo);
	}

	@Override
	public List<Map<String, Object>> selectReviewSales(String year) {
		salesDateVO vo = new salesDateVO();
		vo.setStartDate(year+"0101");
		vo.setEndDate(year+"1231");
		
		return salesDao.selectReviewSales(vo);
	}

	@Override
	public List<Map<String, Object>> selectAdSales(String year) {
		salesDateVO vo = new salesDateVO();
		vo.setStartDate(year+"0101");
		vo.setEndDate(year+"1231");
		
		return salesDao.selectAdSales(vo);
	}

	@Override
	public List<Map<String, Object>> selectDelSales(String year) {
		salesDateVO vo = new salesDateVO();
		vo.setStartDate(year+"0101");
		vo.setEndDate(year+"1231");
		
		return salesDao.selectDelSales(vo);
	}

	@Override
	public List<Map<String, Object>> selectResumeSales(String year) {
		salesDateVO vo = new salesDateVO();
		vo.setStartDate(year+"0101");
		vo.setEndDate(year+"1231");
		
		return salesDao.selectResumeSales(vo);
	}
	
}
