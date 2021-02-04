package com.it.workit.resumes.model;

import java.util.List;

public class ResumeListVO {
	private ResumesVO resumesVo;
	private int resumeNo;
	
	private List<CarrerVO> CarrerVOList;
	private List<AwardVO> AwardVOList;
	private List<ForeignlanguageskillVO> ForeignskillVO;
	private List<LicencseVO> LicenVOList;
	
	public ResumesVO getResumesVo() {
		return resumesVo;
	}
	public void setResumesVo(ResumesVO resumesVo) {
		this.resumesVo = resumesVo;
	}
	
	public List<CarrerVO> getCarrerVOList() {
		return CarrerVOList;
	}
	public int getResumeNo() {
		return resumeNo;
	}
	
	
	public void setResumeNo(int resumeNo) {
		this.resumeNo = resumeNo;
	}
	public void setCarrerVOList(List<CarrerVO> carrerVOList) {
		CarrerVOList = carrerVOList;
	}
	public List<AwardVO> getAwardVOList() {
		return AwardVOList;
	}
	public void setAwardVOList(List<AwardVO> awardVOList) {
		AwardVOList = awardVOList;
	}
	public List<ForeignlanguageskillVO> getForeignskillVO() {
		return ForeignskillVO;
	}
	public void setForeignskillVO(List<ForeignlanguageskillVO> foreignskillVO) {
		ForeignskillVO = foreignskillVO;
	}
	public List<LicencseVO> getLicenVOList() {
		return LicenVOList;
	}
	public void setLicenVOList(List<LicencseVO> licenVOList) {
		LicenVOList = licenVOList;
	}
	
//	@Override
//	public String toString() {
//		return "ResumeListVO [resumesVo=" + resumesVo + ", CarrerVOList=" + CarrerVOList + ", AwardVOList="
//				+ AwardVOList + ", ForeignskillVO=" + ForeignskillVO + ", LicenVOList=" + LicenVOList + "]";
//	}
	
	@Override
	public String toString() {
		return "ResumeListVO [resumesVo=" + resumesVo + ", resumeNo=" + resumeNo + ", CarrerVOList=" + CarrerVOList
				+ ", AwardVOList=" + AwardVOList + ", ForeignskillVO=" + ForeignskillVO + ", LicenVOList=" + LicenVOList
				+ "]";
	}
	
}
