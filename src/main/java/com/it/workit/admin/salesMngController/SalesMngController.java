package com.it.workit.admin.salesMngController;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it.workit.admin.salesMngModel.salesMngService;

@Controller
@RequestMapping("/admin/main/sales")
public class SalesMngController {
	@Autowired private salesMngService salesService;
	private static final Logger logger = LoggerFactory.getLogger(SalesMngController.class);
	
	@RequestMapping("/serviceSales.do")
	public void serviceSales() {
		
	}
	
	@RequestMapping("/totalSales.do")
	public void totalSales(Model model) {
		Calendar cal = Calendar.getInstance();
		
		int y = cal.get(Calendar.YEAR);
		String year = Integer.toString(y);
		
		
		List<Map<String, Object>> totalList = salesService.selectMonthSales(year);
		model.addAttribute("totalList",totalList);
	}
}
