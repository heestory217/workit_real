package com.it.workit.advertising.controller;



import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/advertising")
public class AdvertisingController {
	private static final Logger logger
	=LoggerFactory.getLogger(AdvertisingController.class);
	
	@RequestMapping("advertisingmain.do")
	public String sideMenu() {
		
		return "advertising/advertisingmain";
	}
}
