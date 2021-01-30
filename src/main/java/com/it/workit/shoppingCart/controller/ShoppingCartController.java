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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.shoppingCart.model.CartViewVO;
import com.it.workit.shoppingCart.model.ShoppingCartService;
import com.it.workit.shoppingCart.model.ShoppingCartVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/shop")
public class ShoppingCartController {

	private static final Logger logger = LoggerFactory.getLogger(ShoppingCartController.class);
	@Autowired private ShoppingCartService cartService;
	@Autowired private UsersService usersService;

	@RequestMapping("/shoppingCart.do")
	public void shoppingCart(HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("장바구니 내역 보여주기 userNo={}", userNo);

		//장바구니 내역전달
		List<CartViewVO> cartList = cartService.selectCartList(userNo);

		//결제처리를 위한 기업회원 정보 전달
		UsersVO usersVo = usersService.selectByUserNo(userNo);
		//이름
		String userName = usersVo.getUserName();
		//전화번호
		String hp1 = usersVo.getUserHp1();
		String hp2 = usersVo.getUserHp2();
		String hp3 = usersVo.getUserHp3();
		String userHp = hp1+"-"+hp2+"-"+hp3;
		//이메일
		String email1 = usersVo.getUserEmail1();
		String email2 = usersVo.getUserEmail2();
		String userEmail = email1+"@"+email2;

		model.addAttribute("cartList", cartList);
		model.addAttribute("userName", userName);
		model.addAttribute("userHp", userHp);
		model.addAttribute("userEmail", userEmail);
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

	@ResponseBody
	@RequestMapping("/insertCartAjax.do")
	public int insertCartAjax(@RequestParam String resumeNo, HttpSession session) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("장바구니 담기 userNo={}, resumeNo={}", userNo, resumeNo);
		int resumeNum = Integer.parseInt(resumeNo);

		ShoppingCartVO vo = new ShoppingCartVO();
		vo.setResumeNo(resumeNum);
		vo.setUserNo(userNo);

		int result=0;
		//장바구니에 이미 있는지 체크
		int cnt = cartService.cartDupChk(vo);

		if(cnt>0) {
			result=2;
		}else {
			//없으면 장바구니에 담기
			result = cartService.insertCart(vo);
		}
		return result;
	}
	
}
