package com.it.workit.orders.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.coupon.model.CouponService;
import com.it.workit.coupon.model.CouponVO;
import com.it.workit.orders.model.OrderDetailAdVO;
import com.it.workit.orders.model.OrderDetailDelRvVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.orders.model.OrdersVO;
import com.it.workit.paidService.model.PaidServiceService;
import com.it.workit.paidService.model.PaidServiceVO;
import com.it.workit.recruit.model.RecruitannounceService;
import com.it.workit.recruit.model.RecruitannounceVO;
import com.it.workit.review.model.ReviewService;
import com.it.workit.review.model.ReviewVO;
import com.it.workit.shoppingCart.model.CartViewVO;
import com.it.workit.shoppingCart.model.ShoppingCartService;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/shop")
public class OrdersController {
	
	private static final Logger logger = LoggerFactory.getLogger(OrdersController.class);
	@Autowired private UsersService usersService;
	@Autowired private ShoppingCartService cartService;
	@Autowired private CouponService couponService;
	@Autowired private OrdersService ordersService;
	@Autowired private PaidServiceService paidService; 
	@Autowired private ReviewService reviewService; 
	@Autowired private RecruitannounceService recruitService; 
	
	@RequestMapping("/checkOut.do")
	public void checkOut(HttpSession session, @RequestParam (defaultValue = "0") int corpreviewNo,
		@RequestParam (defaultValue = "0") int paidserviceNo,
		@RequestParam (defaultValue = "0") int recruitannounceNo, Model model) {
		
		//1. 이력서 일 때 장바구니
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("장바구니 내역 보여주기 userNo={}", userNo);
		List<CartViewVO> cartList = cartService.selectCartList(userNo);
		
		//2.기업후기 삭제일때 => 6번
		PaidServiceVO paidServVo = null;
		ReviewVO reviewVo = null;
		RecruitannounceVO recruitVo= null;
		
		//3. 후기열람권일 때, couponName과 paidserviceNo 받아옴
		String couponName = "";
		
		if(corpreviewNo!=0) {
			logger.info("기업후기 삭제, corpreviewNo={}", corpreviewNo);
			paidServVo = paidService.selectPaidServByServiceNo(6);
			reviewVo = reviewService.selectByReviewNo(corpreviewNo);
		}else if(recruitannounceNo!=0){	//광고결제
			logger.info("광고결제, paidserviceNo={}", paidserviceNo);
			paidServVo = paidService.selectPaidServByServiceNo(paidserviceNo);
			recruitVo= recruitService.recruitannounceselectByNo(recruitannounceNo);
		}else if(paidserviceNo>=2 && paidserviceNo<=5) {
			logger.info("후기 열람권 결제, paidserviceNo={}", paidserviceNo);
			paidServVo = paidService.selectPaidServByServiceNo(paidserviceNo);
			if(paidserviceNo==4) {
				couponName = "S5190";
			}else if(paidserviceNo==5) {
				couponName = "S68365";
			}
		}else{
			//이력서일때 => 1번
			paidServVo = paidService.selectPaidServByServiceNo(1);
		}

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
		model.addAttribute("paidServVo", paidServVo);
		model.addAttribute("reviewVo", reviewVo);
		model.addAttribute("recruitVo", recruitVo);

		model.addAttribute("userName", userName);
		model.addAttribute("userHp", userHp);
		model.addAttribute("userEmail", userEmail);

		model.addAttribute("couponName", couponName);
	}
	
	@ResponseBody
	@RequestMapping("/order.do")
	public int order(@ModelAttribute OrdersVO vo, 
			@RequestParam (required = false) String couponName,
			@RequestParam (defaultValue = "0") int paidServiceNo,
			@RequestParam (defaultValue = "0") int corpreviewNo,
			@RequestParam (defaultValue = "0") int recruitannounceNo, 
			HttpSession session, Model model) {
		
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("주문/결제 userNo={}", userNo);
		
		vo.setUserNo(userNo);
		logger.info("OrdersVO vo={}", vo);
		
		//기업후기
		OrderDetailDelRvVO rvVo = new OrderDetailDelRvVO();
		if(corpreviewNo!=0) {	
			rvVo.setCorpreviewNo(corpreviewNo);
			rvVo.setPaidServiceNo(paidServiceNo);
		}
		
		//광고결제
		OrderDetailAdVO adVo = new OrderDetailAdVO();
		if(recruitannounceNo!=0) {
			adVo.setRecruitannounceNo(recruitannounceNo);
			adVo.setPaidServiceNo(paidServiceNo);
		}
		
		//[1] 주문 테이블 insert
		int cnt=0;
		//[1-1] 쿠폰 여부 조회하기
		if(couponName!=null && !couponName.isEmpty()) {
			//쿠폰이 있는 경우 조회해서 입력
			CouponVO couponVo = couponService.selectCoupon(couponName);
			int couponNo = couponVo.getCouponNo();
			vo.setCouponNo(couponNo);
			logger.info("쿠폰이 있는 경우, OrdersVO vo={}", vo);

			if(corpreviewNo!=0) {	//기업후기
				cnt = ordersService.insertOrderWithCoupon(vo, rvVo);
			}else if(recruitannounceNo!=0){	//광고
				cnt = ordersService.insertOrderWithCoupon(vo, adVo);
			}else {	//이력서 구매
				cnt = ordersService.insertOrderWithCoupon(vo);
			}
		}else {	
			//쿠폰이 없는경우
			if(corpreviewNo!=0) {	//기업후기
				cnt = ordersService.insertOrder(vo, rvVo);
			}else if(recruitannounceNo!=0){	//광고
				cnt = ordersService.insertOrder(vo, adVo);
			}else {	//이력서 구매
				cnt = ordersService.insertOrder(vo);
			}
		}
		
		logger.info("주문테이블 insert cnt="+cnt);
		logger.info("insert 이후, OrdersVO vo={}", vo);
		
		//주문완료 페이지로 넘겨주기 위한 orderNo 전달
		int orderNo = vo.getOrderNo();
		logger.info("orderNo", orderNo);
		
		return orderNo;
	}
	
	@RequestMapping("/paymentComplete.do")
	public String paymentComplete(@RequestParam (defaultValue = "0" ) int orderNo, Model model) {
		logger.info("주문 완료 내역 보여주기, orderNo={}", orderNo);
		
		//이력서
		List<Map<String, Object>> list = ordersService.selectOrderdetailsResumeView(orderNo);
		logger.info("주문 내역 list.size={}", list.size());
		
		//기업후기 삭제
		Map<String, Object> ReviewMap = ordersService.selectOrderdetailsDelRVView(orderNo);
		logger.info("주문 내역 ReviewMap={}", ReviewMap);
		
		//광고
		Map<String, Object> AdMap = ordersService.selectOrderdetailsADView(orderNo);
		logger.info("주문 내역 AdMap={}", AdMap);
		
		OrdersVO ordersVo = ordersService.selectOrdersByOrderNo(orderNo);
		logger.info("주문 ordersVo={}", ordersVo);
		
		model.addAttribute("list", list);
		model.addAttribute("ReviewMap", ReviewMap);
		model.addAttribute("AdMap", AdMap);
		model.addAttribute("ordersVo", ordersVo);
		
		return "shop/paymentComplete";
	}

}
