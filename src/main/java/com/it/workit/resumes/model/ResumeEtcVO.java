package com.it.workit.resumes.model;

public class ResumeEtcVO{
	private ResumesVO resumeVo;
	private AwardVO awardVo;
	private CarrerVO carrVo;
	private LicencseVO licenVo;
	private ForeignlanguageskillVO fskillVo;
	public ResumesVO getResumeVo() {
		return resumeVo;
	}
	public void setResumeVo(ResumesVO resumeVo) {
		this.resumeVo = resumeVo;
	}
	public AwardVO getAwardVo() {
		return awardVo;
	}
	public void setAwardVo(AwardVO awardVo) {
		this.awardVo = awardVo;
	}
	public CarrerVO getCarrVo() {
		return carrVo;
	}
	public void setCarrVo(CarrerVO carrVo) {
		this.carrVo = carrVo;
	}
	public LicencseVO getLicenVo() {
		return licenVo;
	}
	public void setLicenVo(LicencseVO licenVo) {
		this.licenVo = licenVo;
	}
	public ForeignlanguageskillVO getFskillVo() {
		return fskillVo;
	}
	public void setFskillVo(ForeignlanguageskillVO fskillVo) {
		this.fskillVo = fskillVo;
	}
	@Override
	public String toString() {
		return "ResumeEtcVO [resumeVo=" + resumeVo + ", awardVo=" + awardVo + ", carrVo=" + carrVo + ", licenVo="
				+ licenVo + ", fskillVo=" + fskillVo + "]";
	}
	
	
}
