package com.it.workit.corp.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.workit.corp.model.AppResumeUserAllVO;
import com.it.workit.corp.model.AreaListView;
import com.it.workit.corp.model.CorpService;
import com.it.workit.corp.model.LanguageListView;

@Controller
@RequestMapping("/company")
public class CorpRecruitResume {

	private final static Logger logger = LoggerFactory.getLogger(CorpRecruitResume.class);
	
	@Autowired CorpService corpService;
	
	@RequestMapping("/CorpRecruitResume.do")
	public String CorpRecruitResume(HttpSession session, Model model) {
		logger.info("채용 공고별 지원서, 맞춤채용 공고 보여주기");
		//1. 
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("userNo={}",userNo);

		//채용공고 카테고리를 위한 db작업
		List<Map<String, Object>> recruitList = corpService.selectRecruitList(userNo);
		logger.info("recruitList={}",recruitList.size());
		
		//맞춤 이력서 보여주기를 위한 사용자의 채용공고 정보 : 언어, 경력, 지역
		//List<Map<String, Object>> recruitCont = CorpService.selectRecruitCont(userNo); 		
		
		model.addAttribute("rList",recruitList);
		return "company/CorpRecruitResume";
	}
	
	@ResponseBody
	@RequestMapping("/selectResumeView.do")
	public List<AppResumeUserAllVO> applList(@RequestParam(defaultValue = "0") String recruitannounceNo) {
		logger.info("채용공고별 지원자 리스트 recruitannounceNo={}",recruitannounceNo);
		/*
		[{"appReUsView":{"applicantlistNo":1,"userNo":6,"resumeNo":2,"recruitannounceNo":4,"applicantlistDate":1611579683000,"applicantlistPapercheck":3,"recruitannounceTitle":null,"recruitannounceSworkkind":null,"recruitannounceSpay":null,"resumeTitle":"홍길동_1","userExperience":"1"},"areaList":[{"resumeNo":2,"areaNo":105,"areaAdd1":"경기","areaAdd2":"구리시"}],"languageList":[{"resumeNo":2,"languageNo":1,"languageName":"JAVA"}]},{"appReUsView":{"applicantlistNo":2,"userNo":7,"resumeNo":3,"recruitannounceNo":4,"applicantlistDate":1611579684000,"applicantlistPapercheck":3,"recruitannounceTitle":null,"recruitannounceSworkkind":null,"recruitannounceSpay":null,"resumeTitle":"김길동_1","userExperience":"7"},"areaList":[{"resumeNo":3,"areaNo":88,"areaAdd1":"경기","areaAdd2":"부천시"}],"languageList":[{"resumeNo":3,"languageNo":22,"languageName":"Classic Visual Basic"}]},{"appReUsView":{"applicantlistNo":3,"userNo":8,"resumeNo":4,"recruitannounceNo":4,"applicantlistDate":1611579685000,"applicantlistPapercheck":3,"recruitannounceTitle":null,"recruitannounceSworkkind":null,"recruitannounceSpay":null,"resumeTitle":"최보미_1","userExperience":"7"},"areaList":[{"resumeNo":4,"areaNo":78,"areaAdd1":"울산","areaAdd2":"동구"}],"languageList":[{"resumeNo":4,"languageNo":18,"languageName":"Go"}]},{"appReUsView":{"applicantlistNo":4,"userNo":9,"resumeNo":5,"recruitannounceNo":4,"applicantlistDate":1611579686000,"applicantlistPapercheck":3,"recruitannounceTitle":null,"recruitannounceSworkkind":null,"recruitannounceSpay":null,"resumeTitle":"윤서방_1","userExperience":"3"},"areaList":[{"resumeNo":5,"areaNo":62,"areaAdd1":"인천","areaAdd2":"강화구"}],"languageList":[{"resumeNo":5,"languageNo":33,"languageName":"D"}]},{"appReUsView":{"applicantlistNo":5,"userNo":10,"resumeNo":6,"recruitannounceNo":4,"applicantlistDate":1611579687000,"applicantlistPapercheck":3,"recruitannounceTitle":null,"recruitannounceSworkkind":null,"recruitannounceSpay":null,"resumeTitle":"박진우_1","userExperience":"5"},"areaList":[{"resumeNo":6,"areaNo":28,"areaAdd1":"부산","areaAdd2":"중구"}],"languageList":[{"resumeNo":6,"languageNo":6,"languageName":"Ruby"}]},{"appReUsView":{"applicantlistNo":6,"userNo":11,"resumeNo":7,"recruitannounceNo":4,"applicantlistDate":1611579687000,"applicantlistPapercheck":3,"recruitannounceTitle":null,"recruitannounceSworkkind":null,"recruitannounceSpay":null,"resumeTitle":"박나은_1","userExperience":"0"},"areaList":[{"resumeNo":7,"areaNo":34,"areaAdd1":"부산","areaAdd2":"남구"}],"languageList":[{"resumeNo":7,"languageNo":7,"languageName":"Kotlin"}]}]
		 */
		int no = Integer.parseInt(recruitannounceNo); 
		List<AppResumeUserAllVO> list = corpService.selectResumeView(no);
		for(AppResumeUserAllVO allVo : list) {
			int resumeNo = allVo.getAppReUsView().getResumeNo();
			List<LanguageListView> langList = corpService.selectLanguageList(resumeNo);
			allVo.setLanguageList(langList);
		}
		logger.info("list 사이즈 :  {}",list.size());
		//리스트를 선택하면 언어와 지역을 가져오는 다중선택
		return list;
	}
	
	@RequestMapping("/CorpRecomResume.do")
	public String CorpRecomResume(HttpSession session, Model model) {
		logger.info("기업 맞춤 이력서 보여주기");
		int userNo = (Integer) session.getAttribute("userNo");
		logger.info("userNo={}",userNo);
		//List<Map<String, Object>> claList = corpService.selectCLA(userNo);
		return "company/CorpRecomResume";
	}
	
}
