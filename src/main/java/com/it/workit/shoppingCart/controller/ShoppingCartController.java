package com.it.workit.shoppingCart.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.shoppingCart.model.CartViewVO;
import com.it.workit.shoppingCart.model.ShoppingCartService;

@Controller
@RequestMapping("/shop")
public class ShoppingCartController {
	
	private static final Logger logger = LoggerFactory.getLogger(ShoppingCartController.class);
	@Autowired private ShoppingCartService cartService;
	
	@RequestMapping("/shoppingCart.do")
	public void shoppingCart(HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("장바구니 내역 보여주기 userNo={}", userNo);
		
		List<CartViewVO> cartList = cartService.selectCartList(userNo);
		model.addAttribute("cartList", cartList);
	}
	
	@RequestMapping("/deleteOne.do")
	public String deleteOneFromCart(@RequestParam (defaultValue = "0") int shoppingCartNo, Model model) {
		logger.info("장바구니 1개 삭제 shoppingCartNo={}", shoppingCartNo);
		
		int cnt = 0;
		if(shoppingCartNo!=0) {
			cnt = cartService.deleteOne(shoppingCartNo);
		}
		logger.info("장바구니 1개 삭제 결과, cnt={}", cnt);
		
		return "redirect:/shop/shoppingCart.do";
	}
	
	@RequestMapping("/clearCart.do")
	public String clearCart(HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("장바구니 비우기 userNo={}", userNo);
		
		int cnt = cartService.clearCart(userNo);
		
		return "redirect:/shop/shoppingCart.do";
	}
}
