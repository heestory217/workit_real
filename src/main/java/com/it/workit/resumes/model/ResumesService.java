package com.it.workit.resumes.model;

import java.util.List;
import java.util.Map;

import com.it.workit.users.model.arealistVO;

public interface ResumesService {
	//이력서 단일 레코드 확인 (희정)
	ResumesAllVO searchResumeByNo(int resumeNo);

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

	//선택 삭제
	public int selectDel(ResumeEtcVO resumeEtcVo);

	//언어 인서트
	public int insertUserlang(CorpuselanguageVO userlangVo);

	//지역번호 구하기
	public List<AreaVO> selectAreaNo(String areaAdd2);

	//지역 인서트
	public int insertUserArea(UserwantedworkareaVO userAreaVo);

	//이력서 승인대기로 업데이트
	public int resumeOpen(int resumeNo);
}
