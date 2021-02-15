package com.it.workit.admin.fa.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.admin.notice.model.NoticeVO;
import com.it.workit.common.PaginationInfo;
import com.it.workit.common.SearchVO;
import com.it.workit.faq.model.FaqListVo;
import com.it.workit.faq.model.FaqService;
import com.it.workit.faq.model.FaqVO;

@Controller
@RequestMapping("/admin/fa")
public class FaController {

	private static final Logger logger
		=LoggerFactory.getLogger(FaController.class);
	
	@Autowired private FaqService faqService;
	
	@RequestMapping("/faList.do")
	public void faqList(@ModelAttribute SearchVO searchVo,Model model) {
		//1
		logger.info("fa화면");

		//[1]pagingInfo
		PaginationInfo pagingInfo=new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);

		
		//[2]searchVo
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(10);
				
		int totalRecord=faqService.totalfa(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		logger.info("총 레코드 수, totalRecord={}", totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		
		//2
		List<FaqVO> faqList= faqService.selectAllMng(searchVo);

		//3
		model.addAttribute("faqList",faqList);
		model.addAttribute("pagingInfo", pagingInfo);
	}

	@RequestMapping(value = "/faWrite.do", method = RequestMethod.GET)
	public void faqWrite_get() {
		logger.info("faq 쓰기화면");
	}

	@ResponseBody
	@RequestMapping(value = "/faWrite.do", method = RequestMethod.POST)
	public int faqWrite_post(@ModelAttribute FaqVO faqVo, 
			HttpSession session, Model model) {
		logger.info("faq 쓰기 화면, 파라미터 faqVo={}",faqVo);

		//2
		int cnt = faqService.faqinsert(faqVo);
		logger.info("글쓰기 처리 결과 cnt={}", cnt);

		//4
		return cnt;
	}

	@RequestMapping(value = "/faDetail.do", method = RequestMethod.GET)
	public void faqDetail_get(@RequestParam(defaultValue = "0") int faqNo, Model model) {
		logger.info("faq 디테일 화면 파라미터 no={}",faqNo);

		//2
		FaqVO faqVo = faqService.faqselectByNo(faqNo);
		logger.info("화면처리 faqVo={}",faqVo);

		//3
		model.addAttribute("faqVo", faqVo);
	}

	@RequestMapping(value = "/faqUpdate.do", method = RequestMethod.GET)
	public String faqUpdate_get(@RequestParam(defaultValue = "0") int faqNo, Model model) {
		logger.info("faq 업데이트 화면 파라미터 no={}",faqNo);

		//2
		FaqVO faqVo = faqService.faqselectByNo(faqNo);
		if (faqNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/faq/faqList.do");
			return "common/message";
		}
		logger.info("화면처리 faqVo={}",faqVo);

		//3
		model.addAttribute("faqVo", faqVo);

		//4
		return "faq/faqUpdate";
	}

	@RequestMapping(value = "/faqUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public int faqUpdate_post(@ModelAttribute FaqVO faqVo, Model model) {
		logger.info("faq 디테일 화면 파라미터 faqVo={}",faqVo);

		//2
		int cnt = faqService.faqupdate(faqVo);
		logger.info("글 수정 성공 cnt={}",cnt);

		//4
		return cnt;
	}

	@RequestMapping(value = "/faqDelete.do")
	public String faqDelete(@ModelAttribute FaqVO faqVo
			,Model model) {
		logger.info("삭제처리 파라미터 faqVo={}", faqVo);

		//2
		int cnt = faqService.faqdelete(faqVo.getFaqNo());

		String msg="삭제 실패하였습니다", url="/admin/fa/faqList.do";
		if (cnt>0) {
			msg="삭제 성공하였습니다";
			url="/admin/fa/faList.do";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}
	
	@RequestMapping(value = "/multiDel.do")
	public String multiDel(@ModelAttribute FaqListVo flistVo, Model model) {
		logger.info("선택 삭제 처리, 파라미터 ");
		
		List<FaqVO> flist = flistVo.getFlist();
		logger.info("flist 리스트, flist={}", flist);
		
		int cnt=faqService.multiDel(flist);
		logger.info("선택 삭제 결과, cnt={}", cnt);
		//파일 삭제는 delete 성공한 경우에만 처리되도록
		String msg="공지사항 삭제에 실패하였습니다.\\n다시 시도해주세요.", url="/admin/fa/faList.do";
		if(cnt>0) {
			msg="선택한 공지가 정상적으로 삭제되었습니다.";
			for(int i=0;i<flist.size();i++) {
				FaqVO vo=flist.get(i);
				logger.info("[{}] : faqNo={}", i, vo.getFaqNo());
				//=> 선택되지 않은 것들은 productNo=0으로 찍힘
				
			}//for
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "common/message";
	}
}
