package com.it.workit.resumes.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	
	@Override
	public int insertResume(ResumesVO resumeVo) {
		return resumesDao.insertResume(resumeVo);
	}

	@Override
	@Transactional
	public int insertResumesMulti(ResumeListVO resumlist) {
		int cnt =0;
		
//		ResumesVO resumesVo = resumlist.getResumesVo();
//		cnt = resumesDao.insertResume(resumesVo);
		
		for (AwardVO aVo : resumlist.getAwardVOList()) {
			cnt = resumesDao.insertAward(aVo);
		}
		for (LicencseVO licenVo : resumlist.getLicenVOList()) {
			cnt = resumesDao.insertLicen(licenVo);
		}
		for (CarrerVO carrVo : resumlist.getCarrerVOList()) {
			cnt = resumesDao.insertCarrer(carrVo);
		}
		for (ForeignlanguageskillVO foreignVo : resumlist.getForeignskillVO()) {
			cnt = resumesDao.insertForeignskill(foreignVo);
		}
		return cnt;
	
	}//

	
}
