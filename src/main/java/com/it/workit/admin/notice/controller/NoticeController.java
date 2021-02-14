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
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.admin.notice.model.ClassificationsVO;
import com.it.workit.admin.notice.model.NoticeListVO;
import com.it.workit.admin.notice.model.NoticeSearchVO;
import com.it.workit.admin.notice.model.NoticeService;
import com.it.workit.admin.notice.model.NoticeVO;
import com.it.workit.common.FileUploadUtil;
import com.it.workit.common.PaginationInfo;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {
	private static final Logger logger
		=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired private NoticeService noticeService;
	@Autowired private FileUploadUtil fileUtil;
	
	
	
	//공지사항 목록 조회
	@RequestMapping("/noticeList.do")
	public String noticeList(@ModelAttribute NoticeSearchVO searchVo ,
			@RequestParam(defaultValue = "0") int type, Model model) {
		logger.info("관리자 - 공지사항 목록 조회");

		List<ClassificationsVO> cateList = noticeService.selectClassifications();
		logger.info("관리자 - 공지사항 카테고리 조회 결과, cateList.size={}", cateList.size());
		
		int all=0,notice=0,event=0,guide=0;
		if(type==0) {
			searchVo.setClassificationNo(0);
			all=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수, all={}", all);
		}else if(type==1) {
			searchVo.setClassificationNo(1);
			notice=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수 - 공지, notice={}", notice);
		}else if(type==2) {
			searchVo.setClassificationNo(2);
			event=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수 - 이벤트, notice={}", notice);
		}else if(type==3) {
			searchVo.setClassificationNo(3);
			guide=noticeService.getTotalRecord(searchVo);
			logger.info("공지사항 총 레코드 수 - 안내, notice={}", notice);
		}
		
		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
		
		int totalRecord=0;
		List<Map<String, Object>> noticeList = null;
		if(type==0) {
			searchVo.setClassificationNo(0);
			noticeList = noticeService.selectNoticeAll(searchVo);
			logger.info("공지사항 전체 조회 결과, noticeList.size={}", noticeList.size());
			totalRecord=all;
		}else if(type==1) {
			searchVo.setClassificationNo(1);
			noticeList = noticeService.selectNoticeAll(searchVo);
			logger.info("공지사항 조회 결과-공지, noticeList.size={}", noticeList.size());
			totalRecord=notice;
		}else if(type==2) {
			searchVo.setClassificationNo(2);
			noticeList = noticeService.selectNoticeAll(searchVo);
			logger.info("공지사항 조회 결과-이벤트, noticeList.size={}", noticeList.size());
			totalRecord=event;
		}else if(type==3) {
			searchVo.setClassificationNo(3);
			noticeList = noticeService.selectNoticeAll(searchVo);
			logger.info("공지사항 조회 결과-안내, noticeList.size={}", noticeList.size());
			totalRecord=guide;
		}
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("cateList", cateList);
		
		return "admin/notice/noticeList";
		
	}
	
	//공지사항 등록 화면
	@RequestMapping("/noticeWrite.do")
	public void write() {
		logger.info("공지사항 등록 화면");
	}
	
	//공지사항 등록 처리
	@ResponseBody
	@RequestMapping(value="/noticeRegister.do",method=RequestMethod.POST)
	public int write_post(@ModelAttribute NoticeVO vo, HttpSession session) {
		int managerNo=(Integer) session.getAttribute("managerNo");
		vo.setManagerNo(managerNo);
				
		logger.info("공지사항 등록 처리, 파라미터 vo={},",vo);
		
		int cnt = noticeService.insertNotice(vo);
		logger.info("공지사항 등록 처리 결과,cnt={}",cnt);
		
		return cnt;
	}
	
	
	
	//공지사항 수정 화면
	@RequestMapping("/noticeEdit.do")
	public String edit(@RequestParam int noticeNo, Model model) {
		logger.info("공지사항 수정 화면");
		
		Map<String, Object> noticeOne = noticeService.selectNoticeByNo(noticeNo);
		logger.info("공지사항 수정 화면 조회 결과, noticeOne={}", noticeOne);
		
		model.addAttribute("noticeOne", noticeOne);
		
		return "admin/notice/noticeEdit";
	}
	
	//공지사항 수정
	@ResponseBody
	@RequestMapping("/editNotice.do")
	public int eidt_post(@ModelAttribute NoticeVO vo) {
		logger.info("공지사항 수정 처리, 파라미터 vo={}", vo);
		
		vo.setManagerNo(3);
		int cnt=noticeService.updateNotice(vo);
		logger.info("공지사항 수정 결과, cnt={}", cnt);
		
		return cnt;
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
		logger.info("선택 삭제 처리, 파라미터 ");
		
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

