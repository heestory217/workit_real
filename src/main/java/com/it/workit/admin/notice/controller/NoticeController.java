package com.it.workit.admin.notice.controller;

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

import com.it.workit.admin.notice.model.ClassificationsVO;
import com.it.workit.admin.notice.model.NoticeListVO;
import com.it.workit.admin.notice.model.NoticeService;
import com.it.workit.admin.notice.model.NoticeVO;
import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {
	private static final Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	
	
	
	//공지사항 목록 조회
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute SearchVO searchVo ,Model model) {
		logger.info("관리자 - 공지사항 목록 조회");

		List<ClassificationsVO> cateList = noticeService.selectClassifications();
		logger.info("관리자 - 공지사항 카테고리 조회 결과, cateList.size={}", cateList.size());
		
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord=noticeService.getTotalRecord(searchVo);
		logger.info("공지사항 총 레코드 수, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		List<Map<String, Object>> noticeList = noticeService.selectNoticeAll(searchVo);
		logger.info("공지사항 전체 조회 결과, noticeList.size={}", noticeList.size());
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("cateList", cateList);
		
		return "admin/notice/noticeList";
		
	}
	
	//공지사항 등록 화면
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.GET)
	public void write(@ModelAttribute NoticeVO vo, Model model) {
		logger.info("공지사항 등록 화면");
	}
	
	//공지사항 등록 처리
	@RequestMapping(value="/noticeWrite.do", method = RequestMethod.POST)
	public String write_post(@ModelAttribute NoticeVO vo, Model model) {
		logger.info("공지사항 등록 처리, 파라미터 vo={},",vo);
		
		int cnt = noticeService.insertNotice(vo);
		logger.info("공지사항 등록 처리 결과,cnt={}",cnt);
		String msg="공지사항 등록에 실패하였습니다.\\n다시 등록해주세요.",
				url="/admin/notice/noticeWrite.do";
		if(cnt>=0) {
			msg="공지사항이 정상적으로 등록되었습니다.";
			url="/admin/notice/noticeList.do";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
		
	}
	
	//공지사항 삭제
	@RequestMapping("/noticeDelete.do")
	public String noticeDel(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		logger.info("공지사항 삭제 처리, 파라미터 noticeNo={}", noticeNo);
		
		int cnt = noticeService.deleteNotice(noticeNo);
		String msg="공지사항 삭제에 실패하였습니다.\\n다시 시도해주세요.", url="/admin/notice/noticeList.do";
		if(cnt>0) {
			msg="공지가 정상적으로 삭제되었습니다.";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	//선택 삭제
	@RequestMapping("/multiDel.do")
	public String delMulti(@ModelAttribute NoticeListVO noticeListVo, Model model) {
		//여러개의 vo가 list로 묶여서 넘어옴(여러개의 상품을 선택하여 삭제해야하기 때문)
		logger.info("선택 삭제 처리, 파라미터 noticeListVo={}", noticeListVo);
		
		//파라미터 넘어온 것이 어떻게 처리되는지 살펴보기 위함
		List<NoticeVO> noticeList=noticeListVo.getNoticeList();
		
		int cnt=noticeService.multiDelNotice(noticeList);
		logger.info("선택 삭제 결과, cnt={}", cnt);
		//파일 삭제는 delete 성공한 경우에만 처리되도록
		String msg="공지사항 삭제에 실패하였습니다.\\n다시 시도해주세요.", url="/admin/notice/noticeList.do";
		if(cnt>0) {
			msg="선택한 공지가 정상적으로 삭제되었습니다.";
			for(int i=0;i<noticeList.size();i++) {
				NoticeVO vo=noticeList.get(i);
				logger.info("[{}] : noticeNo={}", i, vo.getNoticeNo());
				//=> 선택되지 않은 것들은 productNo=0으로 찍힘
				
			}//for
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

}

