package com.it.workit.shoppingCart.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/shop")
public class ShoppingCartController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShoppingCartController.class);
	
	@RequestMapping("/shoppingCart.do")
	public void shoppingCart() {}
	
	@RequestMapping("/clearCart.do")
	public String clearCart(@RequestParam int shoppingcartNo) {
		logger.info("장바구니 비우기 shoppingcartNo={}", shoppingcartNo);
		
		return "shop/shoppingCart";
	}
}
