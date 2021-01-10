package com.it.workit;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SJtestController {
	
	@RequestMapping(value = "SJtest.do", method = RequestMethod.GET )
	public void test() {
		
	}
}
