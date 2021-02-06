package com.it.workit.companyMypage.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.Utility;
import com.it.workit.companyMypage.model.CompanypagingVO;
import com.it.workit.orders.model.OrdersCorpPayVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.orders.model.OrdersVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;


@Controller
@RequestMapping("/companyMypage")
public class CompanyMypageController {
	private static final Logger logger =LoggerFactory.getLogger(CompanyMypageController.class);
	@Autowired private UsersService userService;
	@Autowired private OrdersService ordersService;
	
	@RequestMapping(value = "/companyCheckPwd.do", method = RequestMethod.GET)
	public String companyCheckPwd() {
		logger.info("기업유저 마이페이지 - 비밀번호 체크 화면 보여주기");
		
		return "companyMypage/companyCheckPwd";
	}
	
	@RequestMapping(value = "/companyCheckPwd.do", method = RequestMethod.POST)
	public String companyCheckPwdgo(@RequestParam(defaultValue = "0") String pwd, Model model,
			HttpSession session) {
		logger.info("기업유저 마이페이지 - 비밀번호 체크 화면 보여주기");
		
		String userid=(String) session.getAttribute("userId");
		UsersVO vo=userService.selectByUserId(userid);
		
		if(vo.getUserPassword().equals(pwd)) {
			
			model.addAttribute("vo", vo);
			
			return "companyMypage/companyMypageEdit";
		}else {
			String msg="비밀번호가 틀립니다. 다시 시도해주세요.", url="/companyMypage/companyCheckPwd.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
	}
	
	@RequestMapping(value = "/companyMypageEdit.do", method = RequestMethod.GET)
	public String companyMypageEdit() {
		return "companyMypage/companyCheckPwd";
	}
	
	@RequestMapping(value = "/companyMypageEdit.do", method = RequestMethod.POST)
	public String companyMypageEdit(@ModelAttribute UsersVO vo, ModelMap model) {
		logger.info("개인 마이페이지 - 회원정보 수정 파라미터 vo={}",vo);
		
		String hp1=vo.getUserHp1();
		String hp2=vo.getUserHp2();
		String hp3=vo.getUserHp3();

		if(hp2==null || hp2.isEmpty() || hp3==null || hp3.isEmpty()) {
			hp1="";
			hp2="";
			hp3="";
		}

		vo.setUserHp1(hp1);
		vo.setUserHp2(hp2);
		vo.setUserHp3(hp3);
		
		
		String msg="회원정보 수정에 실패했습니다.", url="/companyMypage/companyMypageEdit.do";
		int cnt=userService.updateUsers(vo);
		if(cnt>0) {
			msg="회원정보 수정 성공했습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/companyPayment.do")
	public String companyPayment(Model model,HttpSession session,
			@ModelAttribute CompanypagingVO vo) {
				int userNo=(Integer) session.getAttribute("userNo");
				vo.setUserNo(userNo);
				logger.info("개인 마이페이지 - 결제내역 view 보여주기 / userno={}",userNo);
				logger.info("알림 {}", vo);

				//[1]pagingInfo
				PaginationInfo pagingInfo=new PaginationInfo();
				pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
				pagingInfo.setCurrentPage(vo.getCurrentPage());
				pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT);

				//[2]searchVo
				vo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				vo.setRecordCountPerPage(Utility.RECORD_COUNT);

				int totalRecord=ordersService.ordersGetTotalRecords(vo);
				logger.info("총 레코드 수, totalRecord={}", totalRecord);
				pagingInfo.setTotalRecord(totalRecord);

				model.addAttribute("pagingInfo", pagingInfo);
				List<OrdersCorpPayVO> list=ordersService.selectCompanyPaymentByUserno(vo);

				logger.info("list.size={}",list.size());
				logger.info("list-3={}",list.get(3));
				model.addAttribute("list",list);
		return "companyMypage/companyPayment";
	}
}
