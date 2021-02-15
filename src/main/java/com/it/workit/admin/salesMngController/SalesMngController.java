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
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.admin.salesMngModel.salesMngService;

@Controller
@RequestMapping("/admin/main/sales")
public class SalesMngController {
	@Autowired private salesMngService salesService;
	private static final Logger logger = LoggerFactory.getLogger(SalesMngController.class);
	
	@RequestMapping("/serviceSales.do")
	public void serviceSales(@RequestParam(defaultValue = "0") int years, Model model) {
		Calendar cal = Calendar.getInstance();
		logger.info("들어온 years = {}",years);
		
		String year = "";
		if(years==0) {
			int y = cal.get(Calendar.YEAR);
			year = Integer.toString(y);
		}
		
		List<Map<String, Object>> reviewList = salesService.selectReviewSales(year);
		List<Map<String, Object>> adList = salesService.selectAdSales(year);
		List<Map<String, Object>> delList = salesService.selectDelSales(year);
		List<Map<String, Object>> resumeList = salesService.selectResumeSales(year);
		model.addAttribute("year",year);
		model.addAttribute("reviewList",reviewList);
		model.addAttribute("adList",adList);
		model.addAttribute("delList",delList);
		model.addAttribute("resumeList",resumeList);
	}
	
	@RequestMapping("/totalSales.do")
	public void totalSales(@RequestParam(defaultValue = "0") int years, Model model) {
		Calendar cal = Calendar.getInstance();
		
		logger.info("들어온 years = {}",years);
		
		String year = "";
		if(years==0) {
			int y = cal.get(Calendar.YEAR);
			year = Integer.toString(y);
		}else {
			year = Integer.toString(years);
		}
		
		List<Map<String, Object>> totalList = salesService.selectMonthSales(year);
		model.addAttribute("year",year);
		model.addAttribute("totalList",totalList);
	}
}
