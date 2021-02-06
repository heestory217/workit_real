package com.it.workit.hrm.controller;

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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.common.PaginationInfo;
import com.it.workit.common.Utility;
import com.it.workit.getposition.model.GetPositionService;
import com.it.workit.hrm.model.HrmResumePageVO;
import com.it.workit.orders.model.OrdersService;
import com.it.workit.position.model.PositionListVO;
import com.it.workit.position.model.PositionService;
import com.it.workit.position.model.PositionsuggestVO;
import com.it.workit.users.model.UsersService;
import com.it.workit.users.model.UsersVO;

@Controller
@RequestMapping("/company/HRManagment")
public class HrmController {
	
	private static final Logger logger = LoggerFactory.getLogger(HrmController.class);
	@Autowired private OrdersService ordersService;
	@Autowired private PositionService positionService;
	@Autowired private UsersService userService;
	
	//보낸 제안 & 양식함
	@RequestMapping("/positionSuggest.do")
	public String positionSuggest(HttpSession session, 
			@RequestParam (required = false) String type, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("포지션 제안 조회, userNo={}", userNo);
		
		List<Map<String, Object>> list = null;
		if(type!=null && !type.isEmpty()) {
			list = positionService.selectPositionForm(userNo);	//양식함
		}else {
			list = positionService.selectPositionSuggest(userNo);
		}
		logger.info("보낸 제안 조회 결과 list.size={}", list.size());
		
		model.addAttribute("list", list);
		return "company/HRManagment/position/positionSuggest";
	}
		
	//제안 보내기 (글쓰기)
	@RequestMapping(value="/positionWrite.do", method = RequestMethod.GET)
	public String positionWrite(HttpSession session, Model model) {
		logger.info("포지션제안 쓰기 페이지 보여주기");
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("userId", userId);

		return "company/HRManagment/position/positionWrite";
	}
	
	@RequestMapping(value="/positionWrite.do", method = RequestMethod.POST)
	public String messageWrite_post(HttpSession session, @ModelAttribute PositionsuggestVO vo,
			@RequestParam (required = false) String userId, 
			@RequestParam (required = false) String type, Model model) {

		logger.info("제안 보내기(글쓰기) 처리, PositionsuggestVO vo={}", vo);
		logger.info("userId={}", userId);
		logger.info("type={}", type);
		
		String msg="", url="";

		int userNo=0;
		if(userId!=null && !userId.isEmpty()) {
			UsersVO uVo = new UsersVO();
			uVo = userService.selectByUserId(userId);
			userNo = uVo.getUserNo();
		}else {
			userNo = (Integer) session.getAttribute("userNo");
		}

		int cnt = positionService.insertPositionSuggest(vo, userNo);
		if(cnt>0) {
			if(userId==null || userId.isEmpty()) {
				msg = "작성 제안이 양식함에 저장되었습니다.";
				url="/company/HRManagment/positionSuggest.do?type=format";
			}else {
				msg = userId+"님에게 제안을 성공적으로 보냈습니다.";
				url="/company/HRManagment/positionSuggest.do";
			}
		}else {
			if(type!=null && !type.isEmpty()) {
				url="/company/HRManagment/positionSuggest.do?type=format";
			}else {
				url="/company/HRManagment/positionSuggest.do";
			}
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	//제안 상세보기
	@RequestMapping("/positionDetail.do")
	public String messageDetail_post(@RequestParam (defaultValue = "0") int positionsuggestNo,Model model) {
		logger.info("제안 상세보기");
		logger.info("파라미터 positionsuggestNo={}", positionsuggestNo);
		
		String msg="잘못된 url입니다.", url="/company/HRManagment/positionSuggest.do";
		if(positionsuggestNo==0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}

		Map<String, Object> map = positionService.selectByPositionNo(positionsuggestNo);
		logger.info("map={}", map);
		model.addAttribute("map", map);

		return "/company/HRManagment/position/positionDetail";
	}
	
	//양식 수정하기
	@RequestMapping(value="/modifyPSG.do", method = RequestMethod.GET)
	public String modifyPSG(@RequestParam (defaultValue = "0") int positionsuggestNo, Model model) {
		logger.info("양식 수정하기 화면 보여주기");
		logger.info("파라미터 positionsuggestNo={}", positionsuggestNo);

		if(positionsuggestNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/company/HRManagment/positionSuggest.do?type=format");
			return "common/message";
		}
		
		Map<String, Object> map = positionService.selectByPositionNo(positionsuggestNo);
		logger.info("map={}", map);
		
		model.addAttribute("map", map);
		
		return "company/HRManagment/position/positionModify";
	}
	
	@RequestMapping(value="/modifyPSG.do", method = RequestMethod.POST)
	public String modifyPSG_post(@ModelAttribute PositionsuggestVO vo, Model model) {
		logger.info("양식 수정하기 PositionsuggestVO={}", vo);
		int positionsuggestNo = vo.getPositionsuggestNo();
		
		String msg="잘못된 url입니다.", url="/company/HRManagment/positionSuggest.do?type=format";
		if(positionsuggestNo==0) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", url);
			return "common/message";
		}
		
		int cnt = positionService.updatePSGForm(vo);
		logger.info("수정 결과 cnt={}", cnt);

		if(cnt>0) {
			msg="양식이 성공적으로 수정되었습니다.";
			url="/company/HRManagment/positionDetail.do?type=format&positionsuggestNo="+positionsuggestNo;
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	
	//양식 리스트 불러오기
	@RequestMapping("/getPSGForm.do")
	public String getPSGForm(HttpSession session, Model model) {
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("포지션 제안 조회, userNo={}", userNo);
		
		List<Map<String, Object>> list = null;
		list = positionService.selectPositionForm(userNo);	//양식함
		
		logger.info("양식함 조회 결과 list.size={}", list.size());
		model.addAttribute("list", list);
		
		return "company/HRManagment/position/getPSGForm";
	} 

	//양식 불러오기 ajax
	@ResponseBody
	@RequestMapping("/getPSGFormDetail.do")
	public Map<String, Object> getPSGFormDetail(@RequestParam (defaultValue = "0") int positionsuggestNo) {
		logger.info("제안 불러오기");
		logger.info("파라미터 positionsuggestNo={}", positionsuggestNo);

		Map<String, Object> map = positionService.selectByPositionNo(positionsuggestNo);
		logger.info("map={}", map);

		return map;
	} 
	
	//개별쪽지 삭제하기
	@RequestMapping("/deletePSG.do")
	public String deletePSG(@RequestParam (defaultValue = "0") int positionsuggestNo, 
			@RequestParam (required = false) String type, Model model) {
		logger.info("개별 제안 삭제하기 파라미터 positionsuggestNo={}, type={} ", positionsuggestNo, type);

		String msg="", url="";
		if(type!=null && !type.isEmpty()) {
			url="/company/HRManagment/positionSuggest.do?type=format";
		}else {
			url="/company/HRManagment/positionSuggest.do";
		}

		int cnt=0;
		if(positionsuggestNo!=0) {
			cnt = positionService.deletePSG(positionsuggestNo);
		}

		if(cnt>0) {
			msg="선택한 제안이 삭제되었습니다.";
		}else {
			msg="삭제 처리에 실패하였습니다.";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping("/deleteMultiPosi.do")
	public String deleteMultiPosi(@ModelAttribute PositionListVO positionListVo, 
			@RequestParam (required = false) String type, Model model) {
		logger.info("선택한 제안 다중 삭제(플래그 갱신) 처리, 파라미터 positionListVo={}", positionListVo);
		
		List<PositionsuggestVO> posiList = positionListVo.getPosiItems();
		int cnt = positionService.deleteMultiPosi(posiList);
		logger.info("다중 선택한 제안 삭제 결과, cnt={}", cnt);
		
		String msg="선택한 제안 삭제 실패!", url="";
		if(type!=null && !type.isEmpty()) {
			url="/company/HRManagment/positionSuggest.do?type=format";
		}else {
			url="/company/HRManagment/positionSuggest.do";
		}
		
		if(cnt>0) {
			msg="선택한 제안(들)을 삭제하였습니다.";
			for(int i=0;i<posiList.size();i++) {
				PositionsuggestVO psgVo = posiList.get(i);
				logger.info("[{}] : positionsuggestNo={}", i, psgVo.getPositionsuggestNo());
			}//for
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/purchasedResumes.do")
	public String purchasedResumes(@ModelAttribute HrmResumePageVO searchVo, 
			@RequestParam (required = false) String searchPRKeyword,
			HttpSession session, Model model) {
		logger.info("구매 이력서 페이지");
		
		searchVo.setSearchKeyword(searchPRKeyword);
		logger.info("검색 키워드 : searchKeyword={}", searchPRKeyword);
		
		//키워드 조절
		if(searchPRKeyword!=null && !searchPRKeyword.isEmpty()) {
			if(searchPRKeyword.equals("신입")) {
				searchVo.setSearchKeyword("0");
			}else if(searchPRKeyword.lastIndexOf("년")>0) {
				int idx = searchPRKeyword.lastIndexOf("년");
				searchVo.setSearchKeyword(searchPRKeyword.substring(0, idx));
			}
		}

		int userNo = (Integer) session.getAttribute("userNo");
		searchVo.setUserNo(userNo);
		
		//페이징
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(5);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setRecordCountPerPage(5);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		
		//구매한 이력서 리스트 
		List<Map<String, Object>> resumeList = ordersService.selectPurchasedResume(searchVo);
		logger.info("구매 이력서 list.size={}", resumeList.size());
		
		int totalRecord=ordersService.selectTotalResumeRecord(searchVo);
		logger.info("전체 구매 이력서 수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("resumeList", resumeList);
		
		return "company/HRManagment/purchasedResumes";
	}
	
}
