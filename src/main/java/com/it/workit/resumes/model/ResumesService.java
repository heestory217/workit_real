package com.it.workit.resumes.model;

import java.util.List;
import java.util.Map;

public interface ResumesService {
	

	List<ResumesAllVO> searchResumeByNo(List<Integer> matchList);
	
	int insertResume(ResumesVO resumeVo);

	// 한번에 insert
	int insertResumesMulti(ResumeListVO resumlist);
	
	//개별 insert
	int insertAward(AwardVO aVo);
	int insertCarrer(CarrerVO carrVo);
	int insertLicen(LicencseVO licenVo);
	int insertForeignskill(ForeignlanguageskillVO foreignVo);
	
	public List<ResumesVO> selectResumeByNo(int userNo);
	
	//select
	public Map<String, Object> selectByRsUser(int resumeNo);
	public List<AwardVO> selectAwdByNo(int resumeNo);
	public List<LicencseVO> selectLicenByNo(int resumeNo);
	public List<CarrerVO> selectCarByNo(int resumeNo);
	public List<ForeignlanguageskillVO> selectFlsByNo(int resumeNo);
	
	//삭제
	public int deleteResumes(int resumeNo);
	
	//수정
	public int updateResume(ResumesVO resumeVo);
	public int updateAwd(AwardVO awardVo);
	public int updateCarrer(CarrerVO carrerVo);
	public int updateLicen(LicencseVO licenVo);
	public int updateFskill(ForeignlanguageskillVO fskillVo);
	
//	public int updateMulti(ResumeListVO resumlist);
	
	//선택 삭제
	public int selectDel(ResumeEtcVO resumeEtcVo);
}
