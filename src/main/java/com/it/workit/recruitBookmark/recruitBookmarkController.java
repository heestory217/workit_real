package com.it.workit.recruitBookmark;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it.workit.recruitBookmark.model.RecruitBookmarkService;

@Controller
@RequestMapping("/recruitBookmark")
public class recruitBookmarkController {
	private static final Logger logger = LoggerFactory.getLogger(recruitBookmarkController.class);
	
	@Autowired RecruitBookmarkService BookmarkService;
	
	@RequestMapping("/insertBookmark.do")
	public String insertBookmark(@RequestParam int recruitannounceNo, HttpSession session, Model model) {
		int userNo = (Integer)session.getAttribute("userNo");
		logger.info("userNo={} recruitannounceNo={}",userNo,recruitannounceNo);
		
		Map<String, Object > bookmarkInfo = new HashMap<String, Object>();
		bookmarkInfo.put("userNo", userNo);
		bookmarkInfo.put("recruitannounceNo", recruitannounceNo);
		
		String msg="채용공고 북마크 저장 실패", url="/recruit/recruitdetail.do?recruitannounceNo="+recruitannounceNo;
		
		int cnt = BookmarkService.insertBookmark(bookmarkInfo);
		logger.info("insert result cnt = {}", cnt);
		
		if(cnt==1) {
			msg="채용공고를 북마크에 저장했습니다.";
		}else if(cnt==2) {
			msg="이미 저장된 채용공고 입니다.";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}

}
