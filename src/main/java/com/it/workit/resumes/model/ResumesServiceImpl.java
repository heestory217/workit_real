package com.it.workit.resumes.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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

	//여러개 인서트
	@Override
	@Transactional
	public int insertResumesMulti(ResumeListVO resumlist) {
		int cnt =0;

		//		ResumesVO resumesVo = resumlist.getResumesVo();
		//		cnt = resumesDao.insertResume(resumesVo);
		
		if (resumlist.getAwardVOList() != null) {
			for (AwardVO aVo : resumlist.getAwardVOList()) {
				cnt = resumesDao.insertAward(aVo);
			}
		}else if (resumlist.getLicenVOList() != null) {
			for (LicencseVO licenVo : resumlist.getLicenVOList()) {
				cnt = resumesDao.insertLicen(licenVo);
			}
		} else if (resumlist.getCarrerVOList() != null) {
			for (CarrerVO carrVo : resumlist.getCarrerVOList()) {
				cnt = resumesDao.insertCarrer(carrVo);
			}
		} else if (resumlist.getForeignskillVO() != null) {
			for (ForeignlanguageskillVO foreignVo : resumlist.getForeignskillVO()) {
				cnt = resumesDao.insertForeignskill(foreignVo);
			}
		}
		
		return cnt;

	}//

	//개별 insert
	@Override
	public int insertAward(AwardVO aVo) {
		return resumesDao.insertAward(aVo);
	}
	@Override
	public int insertCarrer(CarrerVO carrVo) {
		return resumesDao.insertCarrer(carrVo);
	}
	@Override
	public int insertLicen(LicencseVO licenVo) {
		return resumesDao.insertLicen(licenVo);
	}
	@Override
	public int insertForeignskill(ForeignlanguageskillVO foreignVo) {
		return resumesDao.insertForeignskill(foreignVo);
	}
	@Override
	public List<ResumesVO> selectResumeByNo(int userNo) {
		return resumesDao.selectResumeByNo(userNo);
	}

	//detail을 위한 select
	@Override
	public Map<String, Object> selectByRsUser(int resumeNo) {
		return resumesDao.selectByRsUser(resumeNo);
	}
	@Override
	public List<AwardVO> selectAwdByNo(int resumeNo) {
		return resumesDao.selectAwdByNo(resumeNo);
	}
	@Override
	public List<LicencseVO> selectLicenByNo(int resumeNo) {
		return resumesDao.selectLicenByNo(resumeNo);
	}
	@Override
	public List<CarrerVO> selectCarByNo(int resumeNo) {
		return resumesDao.selectCarByNo(resumeNo);
	}
	@Override
	public List<ForeignlanguageskillVO> selectFlsByNo(int resumeNo) {
		return resumesDao.selectFlsByNo(resumeNo);
	}
	
	//선택 삭제
	@Override
	@Transactional
	public int deleteResumes(int resumeNo) {
		int cnt=0;
		
		if (resumeNo!=0) {
			cnt = resumesDao.delResume(resumeNo);
		}else if (resumeNo!=0) {
			cnt = resumesDao.delAwd(resumeNo);
		}else if (resumeNo!=0) {
			cnt = resumesDao.delCarrer(resumeNo);
		}else if (resumeNo!=0) {
			cnt = resumesDao.delFskill(resumeNo);
		}else if (resumeNo!=0) {
			cnt = resumesDao.delLicen(resumeNo);
		}
		
		return cnt;
	}

	//수정
	@Override
	public int updateResume(ResumesVO resumeVo) {
		return resumesDao.updateResume(resumeVo);
	}
	@Override
	public int updateAwd(AwardVO awardVo) {
		return resumesDao.updateAwd(awardVo);
	}
	@Override
	public int updateCarrer(CarrerVO carrerVo) {
		return resumesDao.updateCarrer(carrerVo);
	}
	@Override
	public int updateLicen(LicencseVO licenVo) {
		return resumesDao.updateLicen(licenVo);
	}
	@Override
	public int updateFskill(ForeignlanguageskillVO fskillVo) {
		return resumesDao.updateFskill(fskillVo);
	}

	@Override
	@Transactional
	public int selectDel(ResumeEtcVO resumeEtcVo) {
		int cnt=0;
		
		if (cnt == resumeEtcVo.getAwardVo().getAwardNo()) {
			resumesDao.selDelAwd(resumeEtcVo.getAwardVo().getAwardNo());
		} else if (cnt == resumeEtcVo.getCarrVo().getCarrerNo()) {
			resumesDao.selDelCarrer(resumeEtcVo.getCarrVo().getCarrerNo());
		} else if (cnt == resumeEtcVo.getLicenVo().getLicencseNo()) {
			resumesDao.selDelLicen(resumeEtcVo.getLicenVo().getLicencseNo());
		} else if (cnt == resumeEtcVo.getFskillVo().getForeignlanguageskillNo()) {
			resumesDao.selDelFskill(resumeEtcVo.getFskillVo().getForeignlanguageskillNo());
		} 
		
		return cnt;
	}


	@Override
	public int insertUserlang(CorpuselanguageVO userlangVo) {
		return resumesDao.insertUserlang(userlangVo);
	}
	

	@Override
	public int selectAreaNo(AreaVO areaVo) {
		return resumesDao.selectAreaNo(areaVo);
	}

	@Override
	public int insertUserArea(UserwantedworkareaVO userAreaVo) {
		return resumesDao.insertUserArea(userAreaVo);
	}


	
}
