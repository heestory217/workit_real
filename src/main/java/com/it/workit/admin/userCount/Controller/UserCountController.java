package com.it.workit.admin.userCount.Controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/main/userCount")
public class UserCountController {
	private static final Logger logger=
			LoggerFactory.getLogger(UserCountController.class);
	
	@RequestMapping("/newUsers.do")
	public String newUsers() {
		logger.info("신규 가입자 차트");
		
		return "/admin/main/userCount/newUsers";
	}
}
