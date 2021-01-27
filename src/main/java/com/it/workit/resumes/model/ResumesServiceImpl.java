package com.it.workit.resumes.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumesServiceImpl implements ResumesService{
	@Autowired private ResumesDAO resumesDao;

	@Override
	public List<ResumesAllVO> searchResumeByNo(List<Integer> matchList) {
		List<ResumesAllVO> resumeList = new ArrayList<ResumesAllVO>();
		if(!matchList.isEmpty() || matchList.size()>0) {
			for(int i=0;i<matchList.size();i++) {
				int resumeNo = matchList.get(i);
				System.out.println("서비스로 넘어간 resumeNo : "+resumeNo);
				resumeList.add(resumesDao.searchResumeByNo(resumeNo));
				System.out.println("resumeList.get(i) : "+resumeList.get(i));
			}
		}
		return resumeList;
	}
}
