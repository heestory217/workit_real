package com.it.workit.admin.userCount.Controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.it.workit.common.DateSearchVO;
import com.it.workit.users.model.UsersDAO;

@Controller
@RequestMapping("/admin/main/userCount")
public class UserCountController {
	private static final Logger logger=
			LoggerFactory.getLogger(UserCountController.class);
	
	@Autowired private UsersDAO usersDao;
	
	@RequestMapping("/newUsers.do")
	public String newUsers() {
		logger.info("신규 가입자 차트");
		
		return "admin/main/userCount/newUsers";
	}
	
	@RequestMapping("/userStats.do")
	public String userStats_get(@ModelAttribute DateSearchVO searchVo, Model model) {
		logger.info("user 현황 차트, searchVo={}",searchVo);
		
		//날짜가 넘어오지 않은 경우 현재일자를 셋팅
		String startDay=searchVo.getStartDay();
		if(startDay==null || startDay.isEmpty()) {
			Date d = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today=sdf.format(d);
			searchVo.setStartDay(today);
			searchVo.setEndDay(today);			
		}
		
		int totalNewUsers=usersDao.selectTotalUserByDate(searchVo);
		int totalNewCorps=usersDao.selectTotalCorpByDate(searchVo);
		int totalWithdrawUsers=usersDao.selectTotalWithdrawUsersByDate(searchVo);
		int totalWithdrawCorps=usersDao.selectTotalWithdrawCorpByDate(searchVo);
		
		model.addAttribute("totalNewUsers", totalNewUsers);
		model.addAttribute("totalNewCorps", totalNewCorps);
		model.addAttribute("totalWithdrawUsers", totalWithdrawUsers);
		model.addAttribute("totalWithdrawCorps", totalWithdrawCorps);
		
		model.addAttribute("dateSearchVO", searchVo);
		
		return "admin/main/userCount/userStats";
	}

	
	/*
	 * @RequestMapping(value = "/userStats.do", method = RequestMethod.POST) public
	 * String userStats_post(@ModelAttribute DateSearchVO searchVo, Model model) {
	 * logger.info("user 현황 차트 post, searchVo={}",searchVo);
	 * 
	 * //날짜가 넘어오지 않은 경우 현재일자를 셋팅 String startDay=searchVo.getStartDay();
	 * if(startDay==null || startDay.isEmpty()) { Date d = new Date();
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); String
	 * today=sdf.format(d); searchVo.setStartDay(today); searchVo.setEndDay(today);
	 * }
	 * 
	 * model.addAttribute("dateSearchVO", searchVo);
	 * 
	 * return "admin/main/userCount/userStats"; }
	 */
}
